Return-Path: <jailhouse-dev+bncBD65FYEH6ABBB2OD7SSAMGQEV2GUQEI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x1037.google.com (mail-pj1-x1037.google.com [IPv6:2607:f8b0:4864:20::1037])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CEE744275
	for <lists+jailhouse-dev@lfdr.de>; Fri, 30 Jun 2023 20:41:48 +0200 (CEST)
Received: by mail-pj1-x1037.google.com with SMTP id 98e67ed59e1d1-262dc227ca9sf2037395a91.1
        for <lists+jailhouse-dev@lfdr.de>; Fri, 30 Jun 2023 11:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1688150506; x=1690742506;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n8XRhrWTllhi0i2SVDJkr0FztkDYTgt2jXP3SHVx4GM=;
        b=ILsBQ8vbzJJAamD7T/ZuDLIwzumNUKVTMq9uRALCLz5zsM6qItzFX2wMoyClZWTXnN
         d2CY5gpou7oMKkW1rXUa8eXQ33c5HjGYuBOEyjDO/PYg8xwozchHHnm0a9rlfNYEWY/j
         uqPpAYI00+Vv8nZEuQ20SmNbnE8Dxk8uA0sQVIO3M3F5qEG5B9pndT5u1kkILyC9jc8q
         t0Mqa+eAcZuibziOC7ci8099HKmHTS8Y+TsC3RcCKXsYIPdl7ERooO4dzyxqkWYg71jG
         HqPGXwcjpOsi2VGiw9a0t8ZRlffqcEIJfkkoU/g2GxugDLmzUJuAsXyTMNxes7X1Ekjj
         hw1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688150506; x=1690742506;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n8XRhrWTllhi0i2SVDJkr0FztkDYTgt2jXP3SHVx4GM=;
        b=ase+f7P0fsuGHJbuoFSzpLOVlzlECuG1lrAjOjtQBKR9UursZaxBPQZinWa6QXTzcR
         Cj1WRYXTLsVwA8X4AWUJdx6Zp2ydCGqoNhAn5U98n4BDJJBVONKZghr0OZRS07jURKuG
         cOX27DPaH+czYr6fjf2vL6oPuESL+g5X3JeJFmsPdPrisrkL2HrAmrVeGnz3k+dFwi52
         90uqcGYmPhvzUuUlHZ2RFmuzSZ+M/IgFDqbxLXU6wmwcOX2dEsYftcHNsfO80eHhuqYG
         ZyioYIG4bFrCXhve+PLpOjtKgVOKCDiRW9o0PRCwQ95dxRMRrMcjOwIwFGBxjlC3zMZQ
         V2pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688150506; x=1690742506;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n8XRhrWTllhi0i2SVDJkr0FztkDYTgt2jXP3SHVx4GM=;
        b=JbpIUlRW/luXC7/p8LYIjychBR/oyEI6jUqQY9okKT9bts2PkyfuBumLnRwgxBmcT0
         VxTC6TruLHfjLrRFVKRIrX22MfXwwynxTDeuVEgowg8BRIpG6X2F5xRCNPtHijlelUQk
         oOnw5jn57BNGjnPFlo9mtVglhwOUugolK3m4Xj5PMghJt1zn9hQd3ETx6+GqcHADt/of
         goHJMU/9h6BVYgXn2Ow/u20/8ACC4214YvB1FSttMh1YOUv20H71L5gXtmO5slIVIdCk
         EZhcR7sWwXl1v035GJ/S3VCe2koMiH/i3zzUl+W017hRzRilXEQCnHCk/m0FMgxPcI2l
         ngLA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ABy/qLYnYu+7SpKCc6o2LCRXGsN4t5n9X4HbjOC0N0+NyelXAuqaMJlH
	P4PwViMZ2jJDxG0lnfKqh/k=
X-Google-Smtp-Source: APBJJlEOBi1NxtTKIsgw9i3jWqluX5rIZY4LpY9Lud3Yq/JJjkeeuryTbYiW9L2GwSIQ46b3o9YKEQ==
X-Received: by 2002:a17:90a:1e:b0:263:25f9:6603 with SMTP id 30-20020a17090a001e00b0026325f96603mr3091313pja.13.1688150506064;
        Fri, 30 Jun 2023 11:41:46 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90a:6602:b0:262:e480:3af8 with SMTP id
 l2-20020a17090a660200b00262e4803af8ls1651066pjj.2.-pod-prod-03-us; Fri, 30
 Jun 2023 11:41:44 -0700 (PDT)
X-Received: by 2002:a17:903:2382:b0:1b5:e37:c0ea with SMTP id v2-20020a170903238200b001b50e37c0eamr2035064plh.10.1688150504199;
        Fri, 30 Jun 2023 11:41:44 -0700 (PDT)
Date: Fri, 30 Jun 2023 11:41:43 -0700 (PDT)
From: sai krishna Allu <saikrishna.allu@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <a6b770c4-fabc-4234-af8d-4736b8679853n@googlegroups.com>
Subject: how to build jailhouse-images for RPI 4
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_13828_1099319323.1688150503308"
X-Original-Sender: saikrishna.allu@gmail.com
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>

------=_Part_13828_1099319323.1688150503308
Content-Type: multipart/alternative; 
	boundary="----=_Part_13829_1294829692.1688150503308"

------=_Part_13829_1294829692.1688150503308
Content-Type: text/plain; charset="UTF-8"

Hi,

I am using Raspberry Pi 4, which is installed with Ubuntu 20.04.5 LTS 64 
bit.

I am trying to build jailhouse-images for RPI4 from below link
GitHub - siemens/jailhouse-images: Jailhouse demonstration and testing 
images <https://github.com/siemens/jailhouse-images>

I have used docker for the installation.
ubuntu@ubuntu:~/jailhouse-images$ ./kas-container menu

*Selection RPI4 given in image attached  - RPI4.png*

2023-06-30 12:37:02 - INFO     - kas 2.6.2 started
2023-06-30 12:38:02 - INFO     - Saving configuration as /work/.config.yaml
2023-06-30 12:38:03 - INFO     - /repo$ git rev-parse --show-toplevel
2023-06-30 12:38:03 - INFO     - Using /repo as root for repository 
jailhouse
2023-06-30 12:38:03 - INFO     - /work/isar$ git remote set-url origin 
https://github.com/ilbers/isar
2023-06-30 12:38:03 - INFO     - /work/isar$ git cat-file -t 
5f87d48f279761c2fefef1db16b4ccb5b955a364
2023-06-30 12:38:03 - INFO     - Repository isar already contains 
5f87d48f279761c2fefef1db16b4ccb5b955a364 as commit
2023-06-30 12:38:03 - INFO     - /repo$ git rev-parse --show-toplevel
2023-06-30 12:38:03 - INFO     - Using /repo as root for repository 
jailhouse
2023-06-30 12:38:03 - INFO     - /work/isar$ git status -s
2023-06-30 12:38:03 - INFO     - /work/isar$ git rev-parse --verify -q 
origin/5f87d48f279761c2fefef1db16b4ccb5b955a364
2023-06-30 12:38:03 - INFO     - /work/isar$ git checkout -q 
5f87d48f279761c2fefef1db16b4ccb5b955a364
2023-06-30 12:38:03 - INFO     - /repo$ git rev-parse --show-toplevel
2023-06-30 12:38:03 - INFO     - Using /repo as root for repository 
jailhouse
2023-06-30 12:38:03 - INFO     - /repo$ git rev-parse --show-toplevel
2023-06-30 12:38:03 - INFO     - Using /repo as root for repository 
jailhouse
2023-06-30 12:38:03 - INFO     - /work/isar$ /tmp/tmp6lrjv0qv/get_bb_env 
/build
2023-06-30 12:38:03 - INFO     - /repo$ git rev-parse --show-toplevel
2023-06-30 12:38:03 - INFO     - Using /repo as root for repository 
jailhouse
2023-06-30 12:38:03 - INFO     - /build$ /work/isar/bitbake/bin/bitbake -c 
build mc:rpi4-jailhouse-demo:demo-image
Loading cache: 100% 
|#########################################################################################################################################################| 
Time: 0:00:00
Loaded 76 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
Initialising tasks: 100% 
|####################################################################################################################################################| 
Time: 0:00:02
NOTE: No setscene tasks
NOTE: Executing Tasks
ERROR: mc:rpi4-jailhouse-demo:customizations-rpi4-1.0-r0 do_dpkg_build: 
Error executing a python function in exec_python_func() autogenerated:

The stack trace of python calls that resulted in this exception/failure was:
File: 'exec_python_func() autogenerated', lineno: 2, function: <module>
     0001:
 *** 0002:do_dpkg_build(d)
     0003:
File: '/work/isar/meta/classes/dpkg-base.bbclass', lineno: 209, function: 
do_dpkg_build
     0205:    lock = bb.utils.lockfile(d.getVar("REPO_ISAR_DIR") + 
"/isar.lock",
     0206:                             shared=True)
     0207:    bb.build.exec_func("dpkg_do_mounts", d)
     0208:    try:
 *** 0209:        bb.build.exec_func("dpkg_runbuild", d)
     0210:    finally:
     0211:        bb.build.exec_func("dpkg_undo_mounts", d)
     0212:        bb.utils.unlockfile(lock)
     0213:}
*further log is attached in file :RPI4-jailhouse-installation-error*


Please suggest how to resolve the issue.

Regards,
Sai Krishna


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a6b770c4-fabc-4234-af8d-4736b8679853n%40googlegroups.com.

------=_Part_13829_1294829692.1688150503308
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,<div><br /></div><div>I am using=C2=A0Raspberry Pi 4, which is installed=
 with Ubuntu 20.04.5 LTS 64 bit.</div><div><br /></div><div>I am trying to =
build jailhouse-images for RPI4 from below link</div><div><a href=3D"https:=
//github.com/siemens/jailhouse-images">GitHub - siemens/jailhouse-images: J=
ailhouse demonstration and testing images</a><br /></div><div><br /></div><=
div>I have used docker for the installation.</div><div>ubuntu@ubuntu:~/jail=
house-images$ ./kas-container menu</div><div><br /></div><div><b>Selection =
RPI4 given in image attached=C2=A0 - RPI4.png</b></div><div><b><br /></b>20=
23-06-30 12:37:02 - INFO =C2=A0 =C2=A0 - kas 2.6.2 started<br />2023-06-30 =
12:38:02 - INFO =C2=A0 =C2=A0 - Saving configuration as /work/.config.yaml<=
br />2023-06-30 12:38:03 - INFO =C2=A0 =C2=A0 - /repo$ git rev-parse --show=
-toplevel<br />2023-06-30 12:38:03 - INFO =C2=A0 =C2=A0 - Using /repo as ro=
ot for repository jailhouse<br />2023-06-30 12:38:03 - INFO =C2=A0 =C2=A0 -=
 /work/isar$ git remote set-url origin https://github.com/ilbers/isar<br />=
2023-06-30 12:38:03 - INFO =C2=A0 =C2=A0 - /work/isar$ git cat-file -t 5f87=
d48f279761c2fefef1db16b4ccb5b955a364<br />2023-06-30 12:38:03 - INFO =C2=A0=
 =C2=A0 - Repository isar already contains 5f87d48f279761c2fefef1db16b4ccb5=
b955a364 as commit<br />2023-06-30 12:38:03 - INFO =C2=A0 =C2=A0 - /repo$ g=
it rev-parse --show-toplevel<br />2023-06-30 12:38:03 - INFO =C2=A0 =C2=A0 =
- Using /repo as root for repository jailhouse<br />2023-06-30 12:38:03 - I=
NFO =C2=A0 =C2=A0 - /work/isar$ git status -s<br />2023-06-30 12:38:03 - IN=
FO =C2=A0 =C2=A0 - /work/isar$ git rev-parse --verify -q origin/5f87d48f279=
761c2fefef1db16b4ccb5b955a364<br />2023-06-30 12:38:03 - INFO =C2=A0 =C2=A0=
 - /work/isar$ git checkout -q 5f87d48f279761c2fefef1db16b4ccb5b955a364<br =
/>2023-06-30 12:38:03 - INFO =C2=A0 =C2=A0 - /repo$ git rev-parse --show-to=
plevel<br />2023-06-30 12:38:03 - INFO =C2=A0 =C2=A0 - Using /repo as root =
for repository jailhouse<br />2023-06-30 12:38:03 - INFO =C2=A0 =C2=A0 - /r=
epo$ git rev-parse --show-toplevel<br />2023-06-30 12:38:03 - INFO =C2=A0 =
=C2=A0 - Using /repo as root for repository jailhouse<br />2023-06-30 12:38=
:03 - INFO =C2=A0 =C2=A0 - /work/isar$ /tmp/tmp6lrjv0qv/get_bb_env /build<b=
r />2023-06-30 12:38:03 - INFO =C2=A0 =C2=A0 - /repo$ git rev-parse --show-=
toplevel<br />2023-06-30 12:38:03 - INFO =C2=A0 =C2=A0 - Using /repo as roo=
t for repository jailhouse<br />2023-06-30 12:38:03 - INFO =C2=A0 =C2=A0 - =
/build$ /work/isar/bitbake/bin/bitbake -c build mc:rpi4-jailhouse-demo:demo=
-image<br />Loading cache: 100% |##########################################=
###########################################################################=
####################################| Time: 0:00:00<br />Loaded 76 entries =
from dependency cache.<br />NOTE: Resolving any missing task queue dependen=
cies<br />NOTE: Resolving any missing task queue dependencies<br />NOTE: Re=
solving any missing task queue dependencies<br />NOTE: Resolving any missin=
g task queue dependencies<br />Initialising tasks: 100% |##################=
###########################################################################=
#######################################################| Time: 0:00:02<br /=
>NOTE: No setscene tasks<br />NOTE: Executing Tasks<br />ERROR: mc:rpi4-jai=
lhouse-demo:customizations-rpi4-1.0-r0 do_dpkg_build: Error executing a pyt=
hon function in exec_python_func() autogenerated:<br /><br />The stack trac=
e of python calls that resulted in this exception/failure was:<br />File: '=
exec_python_func() autogenerated', lineno: 2, function: &lt;module&gt;<br /=
>=C2=A0 =C2=A0 =C2=A00001:<br />=C2=A0*** 0002:do_dpkg_build(d)<br />=C2=A0=
 =C2=A0 =C2=A00003:<br />File: '/work/isar/meta/classes/dpkg-base.bbclass',=
 lineno: 209, function: do_dpkg_build<br />=C2=A0 =C2=A0 =C2=A00205: =C2=A0=
 =C2=A0lock =3D bb.utils.lockfile(d.getVar("REPO_ISAR_DIR") + "/isar.lock",=
<br />=C2=A0 =C2=A0 =C2=A00206: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shared=3DTrue)<br /=
>=C2=A0 =C2=A0 =C2=A00207: =C2=A0 =C2=A0bb.build.exec_func("dpkg_do_mounts"=
, d)<br />=C2=A0 =C2=A0 =C2=A00208: =C2=A0 =C2=A0try:<br />=C2=A0*** 0209: =
=C2=A0 =C2=A0 =C2=A0 =C2=A0bb.build.exec_func("dpkg_runbuild", d)<br />=C2=
=A0 =C2=A0 =C2=A00210: =C2=A0 =C2=A0finally:<br />=C2=A0 =C2=A0 =C2=A00211:=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.build.exec_func("dpkg_undo_mounts", d)<br />=
=C2=A0 =C2=A0 =C2=A00212: =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.utils.unlockfile(lo=
ck)<br />=C2=A0 =C2=A0 =C2=A00213:}<br /></div><div><b>further log is attac=
hed in file :RPI4-jailhouse-installation-error</b></div><div><br /></div><d=
iv><br /></div><div>Please suggest how to resolve the issue.</div><div><br =
/></div><div>Regards,</div><div>Sai Krishna<br /><div><br /></div><div><br =
/></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/a6b770c4-fabc-4234-af8d-4736b8679853n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/a6b770c4-fabc-4234-af8d-4736b8679853n%40googlegroups.co=
m</a>.<br />

------=_Part_13829_1294829692.1688150503308--

------=_Part_13828_1099319323.1688150503308
Content-Type: application/octet-stream; 
	name=RPI4-jailhouse-installation-error
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=RPI4-jailhouse-installation-error
X-Attachment-Id: 8f636f12-5143-4328-8dc3-db4fd1fcf1f5
Content-ID: <8f636f12-5143-4328-8dc3-db4fd1fcf1f5>

ubuntu@ubuntu:~/jailhouse-images$ ./kas-container menu
2023-06-30 12:37:02 - INFO     - kas 2.6.2 started
2023-06-30 12:38:02 - INFO     - Saving configuration as /work/.config.yaml
2023-06-30 12:38:03 - INFO     - /repo$ git rev-parse --show-toplevel
2023-06-30 12:38:03 - INFO     - Using /repo as root for repository jailhouse
2023-06-30 12:38:03 - INFO     - /work/isar$ git remote set-url origin https://github.com/ilbers/isar
2023-06-30 12:38:03 - INFO     - /work/isar$ git cat-file -t 5f87d48f279761c2fefef1db16b4ccb5b955a364
2023-06-30 12:38:03 - INFO     - Repository isar already contains 5f87d48f279761c2fefef1db16b4ccb5b955a364 as commit
2023-06-30 12:38:03 - INFO     - /repo$ git rev-parse --show-toplevel
2023-06-30 12:38:03 - INFO     - Using /repo as root for repository jailhouse
2023-06-30 12:38:03 - INFO     - /work/isar$ git status -s
2023-06-30 12:38:03 - INFO     - /work/isar$ git rev-parse --verify -q origin/5f87d48f279761c2fefef1db16b4ccb5b955a364
2023-06-30 12:38:03 - INFO     - /work/isar$ git checkout -q 5f87d48f279761c2fefef1db16b4ccb5b955a364
2023-06-30 12:38:03 - INFO     - /repo$ git rev-parse --show-toplevel
2023-06-30 12:38:03 - INFO     - Using /repo as root for repository jailhouse
2023-06-30 12:38:03 - INFO     - /repo$ git rev-parse --show-toplevel
2023-06-30 12:38:03 - INFO     - Using /repo as root for repository jailhouse
2023-06-30 12:38:03 - INFO     - /work/isar$ /tmp/tmp6lrjv0qv/get_bb_env /build
2023-06-30 12:38:03 - INFO     - /repo$ git rev-parse --show-toplevel
2023-06-30 12:38:03 - INFO     - Using /repo as root for repository jailhouse
2023-06-30 12:38:03 - INFO     - /build$ /work/isar/bitbake/bin/bitbake -c build mc:rpi4-jailhouse-demo:demo-image
Loading cache: 100% |#########################################################################################################################################################| Time: 0:00:00
Loaded 76 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
Initialising tasks: 100% |####################################################################################################################################################| Time: 0:00:02
NOTE: No setscene tasks
NOTE: Executing Tasks
ERROR: mc:rpi4-jailhouse-demo:customizations-rpi4-1.0-r0 do_dpkg_build: Error executing a python function in exec_python_func() autogenerated:

The stack trace of python calls that resulted in this exception/failure was:
File: 'exec_python_func() autogenerated', lineno: 2, function: <module>
     0001:
 *** 0002:do_dpkg_build(d)
     0003:
File: '/work/isar/meta/classes/dpkg-base.bbclass', lineno: 209, function: do_dpkg_build
     0205:    lock = bb.utils.lockfile(d.getVar("REPO_ISAR_DIR") + "/isar.lock",
     0206:                             shared=True)
     0207:    bb.build.exec_func("dpkg_do_mounts", d)
     0208:    try:
 *** 0209:        bb.build.exec_func("dpkg_runbuild", d)
     0210:    finally:
     0211:        bb.build.exec_func("dpkg_undo_mounts", d)
     0212:        bb.utils.unlockfile(lock)
     0213:}
File: '/work/isar/bitbake/lib/bb/build.py', lineno: 251, function: exec_func
     0247:    with bb.utils.fileslocked(lockfiles):
     0248:        if ispython:
     0249:            exec_func_python(func, d, runfile, cwd=adir)
     0250:        else:
 *** 0251:            exec_func_shell(func, d, runfile, cwd=adir)
     0252:
     0253:    try:
     0254:        curcwd = os.getcwd()
     0255:    except:
File: '/work/isar/bitbake/lib/bb/build.py', lineno: 452, function: exec_func_shell
     0448:    with open(fifopath, 'r+b', buffering=0) as fifo:
     0449:        try:
     0450:            bb.debug(2, "Executing shell function %s" % func)
     0451:            with open(os.devnull, 'r+') as stdin, logfile:
 *** 0452:                bb.process.run(cmd, shell=False, stdin=stdin, log=logfile, extrafiles=[(fifo,readfifo)])
     0453:        finally:
     0454:            os.unlink(fifopath)
     0455:
     0456:    bb.debug(2, "Shell function %s finished" % func)
File: '/work/isar/bitbake/lib/bb/process.py', lineno: 182, function: run
     0178:        if not stderr is None:
     0179:            stderr = stderr.decode("utf-8")
     0180:
     0181:    if pipe.returncode != 0:
 *** 0182:        raise ExecutionError(cmd, pipe.returncode, stdout, stderr)
     0183:    return stdout, stderr
Exception: bb.process.ExecutionError: Execution of '/build/tmp/work/jailhouse-demo-arm64/customizations-rpi4/1.0-r0/temp/run.dpkg_runbuild.74' failed with exit code 1:
This script can only be run as root:root or builder:<gid of builder>!
id: cannot find name for group ID 1000
(Currently running as builder(1000):1000(1000))
WARNING: exit code 1 from a shell command.


ERROR: Logfile of failure stored in: /build/tmp/work/jailhouse-demo-arm64/customizations-rpi4/1.0-r0/temp/log.do_dpkg_build.74
ERROR: Task (mc:rpi4-jailhouse-demo:/repo/recipes-core/customizations/customizations.bb:do_dpkg_build) failed with exit code '1'
ERROR: mc:rpi4-jailhouse-demo:rpi-firmware-1.20210303-r0 do_dpkg_build: Error executing a python function in exec_python_func() autogenerated:

The stack trace of python calls that resulted in this exception/failure was:
File: 'exec_python_func() autogenerated', lineno: 2, function: <module>
     0001:
 *** 0002:do_dpkg_build(d)
     0003:
File: '/work/isar/meta/classes/dpkg-base.bbclass', lineno: 209, function: do_dpkg_build
     0205:    lock = bb.utils.lockfile(d.getVar("REPO_ISAR_DIR") + "/isar.lock",
     0206:                             shared=True)
     0207:    bb.build.exec_func("dpkg_do_mounts", d)
     0208:    try:
 *** 0209:        bb.build.exec_func("dpkg_runbuild", d)
     0210:    finally:
     0211:        bb.build.exec_func("dpkg_undo_mounts", d)
     0212:        bb.utils.unlockfile(lock)
     0213:}
File: '/work/isar/bitbake/lib/bb/build.py', lineno: 251, function: exec_func
     0247:    with bb.utils.fileslocked(lockfiles):
     0248:        if ispython:
     0249:            exec_func_python(func, d, runfile, cwd=adir)
     0250:        else:
 *** 0251:            exec_func_shell(func, d, runfile, cwd=adir)
     0252:
     0253:    try:
     0254:        curcwd = os.getcwd()
     0255:    except:
File: '/work/isar/bitbake/lib/bb/build.py', lineno: 452, function: exec_func_shell
     0448:    with open(fifopath, 'r+b', buffering=0) as fifo:
     0449:        try:
     0450:            bb.debug(2, "Executing shell function %s" % func)
     0451:            with open(os.devnull, 'r+') as stdin, logfile:
 *** 0452:                bb.process.run(cmd, shell=False, stdin=stdin, log=logfile, extrafiles=[(fifo,readfifo)])
     0453:        finally:
     0454:            os.unlink(fifopath)
     0455:
     0456:    bb.debug(2, "Shell function %s finished" % func)
File: '/work/isar/bitbake/lib/bb/process.py', lineno: 182, function: run
     0178:        if not stderr is None:
     0179:            stderr = stderr.decode("utf-8")
     0180:
     0181:    if pipe.returncode != 0:
 *** 0182:        raise ExecutionError(cmd, pipe.returncode, stdout, stderr)
     0183:    return stdout, stderr
Exception: bb.process.ExecutionError: Execution of '/build/tmp/work/jailhouse-demo-arm64/rpi-firmware/1.20210303-r0/temp/run.dpkg_runbuild.155' failed with exit code 1:
This script can only be run as root:root or builder:<gid of builder>!
id: cannot find name for group ID 1000
(Currently running as builder(1000):1000(1000))
WARNING: exit code 1 from a shell command.


ERROR: Logfile of failure stored in: /build/tmp/work/jailhouse-demo-arm64/rpi-firmware/1.20210303-r0/temp/log.do_dpkg_build.155
ERROR: Task (mc:rpi4-jailhouse-demo:/repo/recipes-bsp/rpi-firmware/rpi-firmware_1.20210303.bb:do_dpkg_build) failed with exit code '1'
WARNING: mc:rpi4-jailhouse-demo:non-root-initramfs-2021.02-r0 do_fetch: Failed to fetch URL https://raw.githubusercontent.com/siemens/jailhouse/9325b765d1ef16af3ad6e84f6dee872cd9e553c9/tools/demos/ivshmem-demo.c;name=ivshmem-demo, attempting MIRRORS if available
ERROR: mc:rpi4-jailhouse-demo:non-root-initramfs-2021.02-r0 do_fetch: Fetcher failure: Fetch command export PSEUDO_DISABLED=1; unset _PYTHON_SYSCONFIGDATA_NAME; export GIT_PROXY_COMMAND="oe-git-proxy"; export NO_PROXY="*"; export PATH="/work/isar/scripts:/work/isar/bitbake/bin:/usr/sbin:/usr/bin:/sbin:/bin"; export HOME="/tmp/tmpjyt0pgiu"; /usr/bin/env wget -t 2 -T 30 --passive-ftp --no-check-certificate -P /build/downloads 'https://raw.githubusercontent.com/siemens/jailhouse/9325b765d1ef16af3ad6e84f6dee872cd9e553c9/tools/demos/ivshmem-demo.c' --progress=dot -v failed with exit code 4, output:
--2023-06-30 12:38:09--  https://raw.githubusercontent.com/siemens/jailhouse/9325b765d1ef16af3ad6e84f6dee872cd9e553c9/tools/demos/ivshmem-demo.c
Resolving raw.githubusercontent.com (raw.githubusercontent.com)... 49.44.79.236, 2405:200:1607:2820:41::36
Connecting to raw.githubusercontent.com (raw.githubusercontent.com)|49.44.79.236|:443... failed: Connection timed out.
Connecting to raw.githubusercontent.com (raw.githubusercontent.com)|2405:200:1607:2820:41::36|:443... failed: Cannot assign requested address.
Retrying.

--2023-06-30 12:38:40--  (try: 2)  https://raw.githubusercontent.com/siemens/jailhouse/9325b765d1ef16af3ad6e84f6dee872cd9e553c9/tools/demos/ivshmem-demo.c
Connecting to raw.githubusercontent.com (raw.githubusercontent.com)|49.44.79.236|:443... failed: Connection timed out.
Connecting to raw.githubusercontent.com (raw.githubusercontent.com)|2405:200:1607:2820:41::36|:443... failed: Cannot assign requested address.
Giving up.


ERROR: mc:rpi4-jailhouse-demo:non-root-initramfs-2021.02-r0 do_fetch: Fetcher failure for URL: 'https://raw.githubusercontent.com/siemens/jailhouse/9325b765d1ef16af3ad6e84f6dee872cd9e553c9/tools/demos/ivshmem-demo.c;name=ivshmem-demo'. Unable to fetch URL from any source.
ERROR: Logfile of failure stored in: /build/tmp/work/jailhouse-demo-arm64/non-root-initramfs/2021.02-r0/temp/log.do_fetch.72
ERROR: Task (mc:rpi4-jailhouse-demo:/repo/recipes-core/non-root-initramfs/non-root-initramfs_2021.02.bb:do_fetch) failed with exit code '1'
ERROR: mc:rpi4-jailhouse-demo:linux-jailhouse-rt-5.10.27-rt36-r0 do_dpkg_build: Error executing a python function in exec_python_func() autogenerated:

The stack trace of python calls that resulted in this exception/failure was:
File: 'exec_python_func() autogenerated', lineno: 2, function: <module>
     0001:
 *** 0002:do_dpkg_build(d)
     0003:
File: '/work/isar/meta/classes/dpkg-base.bbclass', lineno: 209, function: do_dpkg_build
     0205:    lock = bb.utils.lockfile(d.getVar("REPO_ISAR_DIR") + "/isar.lock",
     0206:                             shared=True)
     0207:    bb.build.exec_func("dpkg_do_mounts", d)
     0208:    try:
 *** 0209:        bb.build.exec_func("dpkg_runbuild", d)
     0210:    finally:
     0211:        bb.build.exec_func("dpkg_undo_mounts", d)
     0212:        bb.utils.unlockfile(lock)
     0213:}
File: '/work/isar/bitbake/lib/bb/build.py', lineno: 251, function: exec_func
     0247:    with bb.utils.fileslocked(lockfiles):
     0248:        if ispython:
     0249:            exec_func_python(func, d, runfile, cwd=adir)
     0250:        else:
 *** 0251:            exec_func_shell(func, d, runfile, cwd=adir)
     0252:
     0253:    try:
     0254:        curcwd = os.getcwd()
     0255:    except:
File: '/work/isar/bitbake/lib/bb/build.py', lineno: 452, function: exec_func_shell
     0448:    with open(fifopath, 'r+b', buffering=0) as fifo:
     0449:        try:
     0450:            bb.debug(2, "Executing shell function %s" % func)
     0451:            with open(os.devnull, 'r+') as stdin, logfile:
 *** 0452:                bb.process.run(cmd, shell=False, stdin=stdin, log=logfile, extrafiles=[(fifo,readfifo)])
     0453:        finally:
     0454:            os.unlink(fifopath)
     0455:
     0456:    bb.debug(2, "Shell function %s finished" % func)
File: '/work/isar/bitbake/lib/bb/process.py', lineno: 182, function: run
     0178:        if not stderr is None:
     0179:            stderr = stderr.decode("utf-8")
     0180:
     0181:    if pipe.returncode != 0:
 *** 0182:        raise ExecutionError(cmd, pipe.returncode, stdout, stderr)
     0183:    return stdout, stderr
Exception: bb.process.ExecutionError: Execution of '/build/tmp/work/jailhouse-demo-arm64/linux-jailhouse-rt/5.10.27-rt36-r0/temp/run.dpkg_runbuild.73' failed with exit code 1:
make[1]: Entering directory '/home/builder/linux-jailhouse-rt/linux-5cf8cf58d799b9d16bf522c31d92476dc9e22736/build-full'
  GEN     Makefile
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/kconfig/conf.o
  HOSTCC  scripts/kconfig/confdata.o
  HOSTCC  scripts/kconfig/expr.o
  LEX     scripts/kconfig/lexer.lex.c
  YACC    scripts/kconfig/parser.tab.[ch]
  HOSTCC  scripts/kconfig/lexer.lex.o
  HOSTCC  scripts/kconfig/parser.tab.o
  HOSTCC  scripts/kconfig/preprocess.o
  HOSTCC  scripts/kconfig/symbol.o
  HOSTCC  scripts/kconfig/util.o
  HOSTLD  scripts/kconfig/conf
#
# configuration written to .config
#
make[1]: Leaving directory '/home/builder/linux-jailhouse-rt/linux-5cf8cf58d799b9d16bf522c31d92476dc9e22736/build-full'
Using build-full/.config as base
Merging debian/fragments/preempt-rt.cfg
make[1]: Entering directory '/home/builder/linux-jailhouse-rt/linux-5cf8cf58d799b9d16bf522c31d92476dc9e22736/build-full'
  GEN     Makefile
./.tmp.config.DXoaRk1Duk:6455:warning: override: PREEMPT_RT changes choice state
#
# configuration written to .config
#
make[1]: Leaving directory '/home/builder/linux-jailhouse-rt/linux-5cf8cf58d799b9d16bf522c31d92476dc9e22736/build-full'
Value requested for CONFIG_PREEMPT_NONE not in final .config
Requested value:  # CONFIG_PREEMPT_NONE is not set
Actual value:     CONFIG_PREEMPT_NONE=y

Value requested for CONFIG_PREEMPT not in final .config
Requested value:  CONFIG_PREEMPT=y
Actual value:     # CONFIG_PREEMPT is not set

Value requested for CONFIG_PREEMPT_COUNT not in final .config
Requested value:  CONFIG_PREEMPT_COUNT=y
Actual value:

Value requested for CONFIG_PREEMPTION not in final .config
Requested value:  CONFIG_PREEMPTION=y
Actual value:

Value requested for CONFIG_PREEMPT_RCU not in final .config
Requested value:  CONFIG_PREEMPT_RCU=y
Actual value:

Value requested for CONFIG_TASKS_RCU_GENERIC not in final .config
Requested value:  CONFIG_TASKS_RCU_GENERIC=y
Actual value:

Value requested for CONFIG_TASKS_RCU not in final .config
Requested value:  CONFIG_TASKS_RCU=y
Actual value:

Value requested for CONFIG_UNINLINE_SPIN_UNLOCK not in final .config
Requested value:  CONFIG_UNINLINE_SPIN_UNLOCK=y
Actual value:

Value requested for CONFIG_DEBUG_PREEMPT not in final .config
Requested value:  # CONFIG_DEBUG_PREEMPT is not set
Actual value:

Value requested for CONFIG_PREEMPT_RT not in final .config
Requested value:  CONFIG_PREEMPT_RT=y
Actual value:

This script can only be run as root:root or builder:<gid of builder>!
id: cannot find name for group ID 1000
(Currently running as builder(1000):1000(1000))
WARNING: exit code 1 from a shell command.


ERROR: Logfile of failure stored in: /build/tmp/work/jailhouse-demo-arm64/linux-jailhouse-rt/5.10.27-rt36-r0/temp/log.do_dpkg_build.73
ERROR: Task (mc:rpi4-jailhouse-demo:/repo/recipes-kernel/linux/linux-jailhouse-rt_5.10.27-rt36.bb:do_dpkg_build) failed with exit code '1'
ERROR: mc:rpi4-jailhouse-demo:jailhouse-jailhouse-rt-0.9999-next-r0 do_fetch: Fetcher failure: Fetch command export PSEUDO_DISABLED=1; unset _PYTHON_SYSCONFIGDATA_NAME; export GIT_PROXY_COMMAND="oe-git-proxy"; export NO_PROXY="*"; export PATH="/work/isar/scripts:/work/isar/bitbake/bin:/usr/sbin:/usr/bin:/sbin:/bin"; export HOME="/tmp/tmpjyt0pgiu"; git -c core.fsyncobjectfiles=0 ls-remote git://github.com/siemens/jailhouse  failed with exit code 128, output:
2023/06/30 12:40:19 socat[84] E connect(5, AF=2 20.207.73.82:9418, 16): Connection timed out
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
and the repository exists.

ERROR: Logfile of failure stored in: /build/tmp/work/jailhouse-demo-arm64/jailhouse-jailhouse-rt/0.9999-next-r0/temp/log.do_fetch.71
ERROR: Task (mc:rpi4-jailhouse-demo:/repo/recipes-jailhouse/jailhouse/jailhouse_latest.bb:do_fetch) failed with exit code '1'
NOTE: Tasks Summary: Attempted 81 tasks of which 76 didn't need to be rerun and 5 failed.

Summary: 5 tasks failed:
  mc:rpi4-jailhouse-demo:/repo/recipes-core/customizations/customizations.bb:do_dpkg_build
  mc:rpi4-jailhouse-demo:/repo/recipes-bsp/rpi-firmware/rpi-firmware_1.20210303.bb:do_dpkg_build
  mc:rpi4-jailhouse-demo:/repo/recipes-core/non-root-initramfs/non-root-initramfs_2021.02.bb:do_fetch
  mc:rpi4-jailhouse-demo:/repo/recipes-kernel/linux/linux-jailhouse-rt_5.10.27-rt36.bb:do_dpkg_build
  mc:rpi4-jailhouse-demo:/repo/recipes-jailhouse/jailhouse/jailhouse_latest.bb:do_fetch
Summary: There was 1 WARNING message shown.
Summary: There were 6 ERROR messages shown, returning a non-zero exit code.
2023-06-30 12:40:21 - ERROR    - Command returned non-zero exit status 1
ubuntu@ubuntu:~/jailhouse-images$ 
------=_Part_13828_1099319323.1688150503308
Content-Type: image/png; name=RPI4.PNG
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=RPI4.PNG
X-Attachment-Id: b316e7a9-b382-4397-91fc-5544269cc03d
Content-ID: <b316e7a9-b382-4397-91fc-5544269cc03d>

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
oj3/9+//LaFLVndctZEAAAAASUVORK5CYII=
------=_Part_13828_1099319323.1688150503308--
