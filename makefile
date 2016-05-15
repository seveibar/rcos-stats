all: clean image info pdf

data:
	ssh root@rcos.io "rm -rf collections && mkdir collections"
	ssh root@rcos.io "mongoexport --db observatory3 --collection users --out collections/users.json"
	ssh root@rcos.io "mongoexport --db observatory3 --collection projects --out collections/projects.json"
	ssh root@rcos.io "mongoexport --db observatory3 --collection classyears --out collections/classyears.json"
	ssh root@rcos.io "mongoexport --db observatory3 --collection posts --out collections/posts.json"

copy:
	scp -r root@rcos.io:collections .

run:
	npm start

image:
	npm run imggen

info:
	npm run infogen

pdf:
	npm run pdfgen

clean:
	rm -rf output
	rm -f output.pdf