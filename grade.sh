CPATH='.;../lib/hamcrest-core-1.3.jar;../lib/junit-4.13.2.jar'

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

cp ../TestListExamples.java ./
javac -cp $CPATH *.java
java TestListExamples