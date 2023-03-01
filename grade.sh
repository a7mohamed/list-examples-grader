CPATH='.:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar *.java'

rm -rf tests/
rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

cd student-submission
EXPECT='ListExamples.java'

if [[ -f $EXPECT ]]
then
    echo "ListExamples found!"
else
    echo "Need file ListExamples!"
    exit 1
fi

cd ..
mkdir ./tests
cp ./student-submission/ListExamples.java ./tests
cp ./TestListExamples.java ./tests

cd tests

javac -cp $CPATH *.java

if [ $? -ne 0 ]; then
echo "Compilation failed. Try again."
exit 1
fi

java -cp CPATH org.junit.runner.JUnitCore TestListExamples | grep . > tests_results.txt



