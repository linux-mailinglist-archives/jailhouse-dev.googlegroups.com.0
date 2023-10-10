Return-Path: <jailhouse-dev+bncBDFMTNF7UUERBSVKSWUQMGQEKQN3JPQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oa1-x3a.google.com (mail-oa1-x3a.google.com [IPv6:2001:4860:4864:20::3a])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0A57BFE38
	for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Oct 2023 15:44:45 +0200 (CEST)
Received: by mail-oa1-x3a.google.com with SMTP id 586e51a60fabf-1e96d3ee623sf827155fac.2
        for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Oct 2023 06:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1696945484; x=1697550284; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ixcTm7hG3JcF848SATupN1nNTMk5x4FcoV4+eJQc7cA=;
        b=uveXVRwj3qmFLd5x6ZxqjTPTYkRtwHRJvKp0wGTXbiZiGAkckIIpSwErxBWpyWCjhr
         9BojTn1jdijAAVu/B+WNtiG5HwnvgbR9xsdtDIusziMUxJL9lEM8J3sLno/1/hNOMu6X
         iwKBmY5G3gA0BZNYq/TsoDX5cnLszx2Dwg/Bi10ptaObmE7hz2hrVAFY2jRkhquyr4mC
         nib7C0AA8EQCJNX0jU0vWdaKbGW7SnLGIVXqd9/CCx2LPvnXsS8SQefGpRYsdgFSqzVb
         qh2d+gGLpCTdp58uFjF/iMhF+0DjjjYRe6BhqTEhLrwy/wB7UDsscsJCr62YSQnyGKJb
         mzWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696945484; x=1697550284; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ixcTm7hG3JcF848SATupN1nNTMk5x4FcoV4+eJQc7cA=;
        b=RHUPum6q5foSh85mqfF2KZkmoukcwqpyEaqj7ZrsGW3+fVq9xxmbNaMdhabw8PNiub
         eP26GR9nBoNk0aKBQd5hOW2WVlYbLNQbNNzezXnnD/s0/aeXt8VTfmxB8f/XpF+TuGzY
         lHdFZ0YcFV+47qVCXELBbGx5tjRiMi3KTxHSTWIK/FroPNYiIEzDpxbYHZR1O2gggP7N
         6FHbhJvbN77Xx6h3zyo9kAnmHa0H21BD7Z573AI1gQI1c8mk4MVAFe5GWUAbojeX+ALG
         ZQpczDAHHkqNzM5YYDYgRXnszTVD6UtVzLylN6cozc2URVV/lx8ncjTBKGHuHZDolXBQ
         FfTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696945484; x=1697550284;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ixcTm7hG3JcF848SATupN1nNTMk5x4FcoV4+eJQc7cA=;
        b=PSJiwor9PAlYCbpzqvxAxgSsUnTRJNA7hv/KVnbZ/LzCCUeMbaxreXZPBJMXaGqvSe
         YwGXUTm5vxxoXII51Fue4IfV5xKzCr34ASxVhrAd72RO+q27vQKcJ3YtCo8bLzvuz6B8
         57JCI1rF6pWd6BkYVsPjLsk70fB+wj2sZnc+4DB3Yl6FeVNTQCwup3axCR6TZL4x605V
         igrJPf4qwb59Fqn9cHAaQzCtuf/sgXuOdOFnOTeGjIOGm3oBABimYgBr5m9senil9BqV
         xgO5NepPpKd1JeQ64WdEcO21DLsqS9U019K3H3t6qDRp9H56tOUB5WeGGQa3N9R2T3MI
         50Qw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YxsqAdRbU0N3+/7P6nn2n4jK2M8iKoP+JtvNVCpSQnPjUZum3Xa
	/Y2bNLrf3utsspCs8oDMebY=
X-Google-Smtp-Source: AGHT+IFbKcLMzCzeC6CyZpt00wemtmgOv0kPo/jMR6HonMzZcDUWr7vWoVUjL6NkmSxTby3Ylf3YSw==
X-Received: by 2002:a05:6870:889e:b0:1bb:c0ee:5536 with SMTP id m30-20020a056870889e00b001bbc0ee5536mr21510904oam.47.1696945482889;
        Tue, 10 Oct 2023 06:44:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6870:828c:b0:1bb:b22e:a027 with SMTP id
 q12-20020a056870828c00b001bbb22ea027ls1401846oae.2.-pod-prod-05-us; Tue, 10
 Oct 2023 06:44:41 -0700 (PDT)
X-Received: by 2002:a05:6808:218c:b0:3a3:d677:9a8d with SMTP id be12-20020a056808218c00b003a3d6779a8dmr9665601oib.0.1696945481766;
        Tue, 10 Oct 2023 06:44:41 -0700 (PDT)
Date: Tue, 10 Oct 2023 06:44:41 -0700 (PDT)
From: Anoop M <email2anoopm@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <2f4f422d-bde1-4a52-a437-c846d04f8e77n@googlegroups.com>
Subject: Issue regarding Jailhouse inmate CPU is offline
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_69101_1324695107.1696945481017"
X-Original-Sender: email2anoopm@gmail.com
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

------=_Part_69101_1324695107.1696945481017
Content-Type: multipart/alternative; 
	boundary="----=_Part_69102_618934304.1696945481017"

------=_Part_69102_618934304.1696945481017
Content-Type: text/plain; charset="UTF-8"

Hi,

I was trying jailhouse with a linux inmate on an imx8mp-evk board. I have 
created a yocto build with jailhouse and linux kernel 6.1.22-rt8 which is 
having the patches for real time linux.
Booted the board with running run 'jh_mmcboot' in the uboot prompt.

Once logged into the device, I have started the jailhouse by  running,
cd /usr/share/jailhouse/scripts && ./init_jailhouse_env.sh && cp 
/run/media/boot-mmcblk1p1/Image /usr/share/jailhouse/inmates/kernel/ && 
../tools/jailhouse enable ../cells/imx8mp.cell; jailhouse cell list;

the above command will load the jailhouse.ko and will enable the jailhouse
I got the output of 'jailhouse cell list' as,
root@imx8mp-lpddr4-evk:/usr/share/jailhouse/scripts# jailhouse cell list
ID      Name                    State             Assigned CPUs           
Failed CPUs             
0       imx8mp                  running           0-3  

Then I started the linux inmate, the CPU offset in the cell configuration 
is 0xc which will assign two cores. I am using the same host kernal image 
for the inmate also (6.1.22-rt8). Used the below command to start the inmate
../tools/jailhouse cell linux ../cells/imx8mp-linux-demo.cell 
../inmates/kernel/Image -d ../inmates/dtb/inmate-imx8mp-evk.dtb -c 
"clk_ignore_unused console=ttymxc3,115200 
earlycon=ec_imx6q,0x30890000,115200 root=/dev/mmcblk2p2 rootwait rw"; 
jailhouse cell list;

I got the output of 'jailhouse cell list' as,
root@imx8mp-lpddr4-evk:/usr/share/jailhouse/scripts# jailhouse cell list
ID      Name                    State             Assigned CPUs           
Failed CPUs             
0       imx8mp                  running           0-1                       
                      
1       linux-inmate-demo       running           2-3   

I could login to the inmate using serial console. But the output of 'cat 
/proc/cpuinfo' is showing only one core.
root@imx8mp-lpddr4-evk:~# cat /proc/cpuinfo  
processor       : 0
BogoMIPS        : 16.66
Features        : fp asimd evtstrm aes pmull sha1 sha2 crc32 cpuid
CPU implementer : 0x41
U architecture: 8
CPU variant     : 0x0
CPU part        : 0xd03
CPU resion      : 4

the 'nproc --all' is giving 2

It looks like 2 cores are assigned to the inmate but one of the core is 
offline.

root@imx8mp-lpddr4-evk:/usr/share/jailhouse/scripts# cat 
/sys/devices/system/cpu/cpu0/online 
1
root@imx8mp-lpddr4-evk:/usr/share/jailhouse/scripts# cat 
/sys/devices/system/cpu/cpu1/online 
0

Am I doing something wrong? How can I turn on both the CPUS for the inmate.

Thanks in advance
Anoop


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/2f4f422d-bde1-4a52-a437-c846d04f8e77n%40googlegroups.com.

------=_Part_69102_618934304.1696945481017
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi,<br /><br /></div>I was trying jailhouse with a linux inmate on an =
imx8mp-evk board. I have created a yocto build with jailhouse and linux ker=
nel 6.1.22-rt8 which is having the patches for real time linux.<br />Booted=
 the board with running run 'jh_mmcboot' in the uboot prompt.<br /><br />On=
ce logged into the device, I have started the jailhouse by =C2=A0running,<b=
r />cd /usr/share/jailhouse/scripts &amp;&amp; ./init_jailhouse_env.sh &amp=
;&amp; cp /run/media/boot-mmcblk1p1/Image /usr/share/jailhouse/inmates/kern=
el/ &amp;&amp; ../tools/jailhouse enable ../cells/imx8mp.cell; jailhouse ce=
ll list;<br /><br />the above command will load the jailhouse.ko and will e=
nable the jailhouse<br />I got the output of 'jailhouse cell list' as,<br /=
>root@imx8mp-lpddr4-evk:/usr/share/jailhouse/scripts# jailhouse cell list<b=
r />ID =C2=A0 =C2=A0 =C2=A0Name =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0State =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
Assigned CPUs =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Failed CPUs =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <br />0 =C2=A0 =C2=A0 =C2=A0 imx8mp =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0running =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 0-3 =C2=A0<br /><br />Then I started the linux inmate,=
 the CPU offset in the cell configuration is 0xc which will assign two core=
s. I am using the same host kernal image for the inmate also (6.1.22-rt8). =
Used the below command to start the inmate<br />../tools/jailhouse cell lin=
ux ../cells/imx8mp-linux-demo.cell ../inmates/kernel/Image -d ../inmates/dt=
b/inmate-imx8mp-evk.dtb -c "clk_ignore_unused console=3Dttymxc3,115200 earl=
ycon=3Dec_imx6q,0x30890000,115200 root=3D/dev/mmcblk2p2 rootwait rw"; jailh=
ouse cell list;<br /><br />I got the output of 'jailhouse cell list' as,<br=
 />root@imx8mp-lpddr4-evk:/usr/share/jailhouse/scripts# jailhouse cell list=
<br />ID =C2=A0 =C2=A0 =C2=A0Name =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0State =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 Assigned CPUs =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Failed CPUs =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br />0 =C2=A0 =C2=A0 =C2=A0 imx8mp =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0running =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 0-1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br />1 =C2=A0 =C2=A0 =C2=A0 linux-inmate-d=
emo =C2=A0 =C2=A0 =C2=A0 running =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2-3 =C2=
=A0 <br /><br />I could login to the inmate using serial console. But the o=
utput of 'cat /proc/cpuinfo' is showing only one core.<br />root@imx8mp-lpd=
dr4-evk:~# cat /proc/cpuinfo =C2=A0<br />processor =C2=A0 =C2=A0 =C2=A0 : 0=
<br />BogoMIPS =C2=A0 =C2=A0 =C2=A0 =C2=A0: 16.66<br />Features =C2=A0 =C2=
=A0 =C2=A0 =C2=A0: fp asimd evtstrm aes pmull sha1 sha2 crc32 cpuid<br />CP=
U implementer : 0x41<br />U architecture: 8<br />CPU variant =C2=A0 =C2=A0 =
: 0x0<br />CPU part =C2=A0 =C2=A0 =C2=A0 =C2=A0: 0xd03<br />CPU resion =C2=
=A0 =C2=A0 =C2=A0: 4<br /><br />the 'nproc --all' is giving 2<br /><br />It=
 looks like 2 cores are assigned to the inmate but one of the core is offli=
ne.<br /><br />root@imx8mp-lpddr4-evk:/usr/share/jailhouse/scripts# cat /sy=
s/devices/system/cpu/cpu0/online <br />1<br />root@imx8mp-lpddr4-evk:/usr/s=
hare/jailhouse/scripts# cat /sys/devices/system/cpu/cpu1/online <br />0<br =
/><br />Am I doing something wrong? How can I turn on both the CPUS for the=
 inmate.<br /><br />Thanks in advance<br />Anoop<br /><br /><br />

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/2f4f422d-bde1-4a52-a437-c846d04f8e77n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/2f4f422d-bde1-4a52-a437-c846d04f8e77n%40googlegroups.co=
m</a>.<br />

------=_Part_69102_618934304.1696945481017--

------=_Part_69101_1324695107.1696945481017--
