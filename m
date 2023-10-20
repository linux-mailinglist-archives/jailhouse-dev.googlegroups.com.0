Return-Path: <jailhouse-dev+bncBDKLL2HKV4DRBC4LZKUQMGQE6YUAEJY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oo1-xc3d.google.com (mail-oo1-xc3d.google.com [IPv6:2607:f8b0:4864:20::c3d])
	by mail.lfdr.de (Postfix) with ESMTPS id 559D27D10C5
	for <lists+jailhouse-dev@lfdr.de>; Fri, 20 Oct 2023 15:50:05 +0200 (CEST)
Received: by mail-oo1-xc3d.google.com with SMTP id 006d021491bc7-581e74f7dd5sf1099251eaf.2
        for <lists+jailhouse-dev@lfdr.de>; Fri, 20 Oct 2023 06:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1697809804; x=1698414604; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=32e0TnvFTa8JUacaFK/IE2+LyO/I6EvDGwOPgupA6kk=;
        b=fCWt3YaDPgAmQm1c8cibZcZ5yJillPNtFb2tzVv9etfJx0YLRnWKh033fJkHMBDYXc
         XYquoHAyc5ZJ3xd3ynmxIQmpF+j4nVtRZfMCrZPEJCLfpHZkN/Euh/V79rZGJGgzeDBQ
         0KwjBxbvkVfRNZLPABoP8EbP+jqq+NfaJc1uCxhj/4fJOuYiYO/PwcfmB7hZXAifSltv
         OMt3CEcsmxugdjULeGVpK4aezkmsacJlIY150wSsSyx56hUqchkIJMtkUNQweqnN6XU5
         G650+F4AIIi61VKFm4XDyNawAhGDU7mWVt3UGh30qHFpQA0MTyCAB35qbh/8Y1vJpNOQ
         +gIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697809804; x=1698414604; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=32e0TnvFTa8JUacaFK/IE2+LyO/I6EvDGwOPgupA6kk=;
        b=ZPtXYY3/7XRWfAjzAK2Nk0hNV5uxqyk4MbPjdAR8SY4qYCFbcyCUPGCKUnpNY0fNV+
         y1M/Q5/m1S0BoIPHVbSPl5NN01dhbYNFLO1AO8fM8luDVEusQtJB6O5P1mfqmxXXmUJ1
         KnNELlw9y1Gga9DGJMkpw2LJmU/jkVdf9ll9e9WHXIMv0kXsjlTNEakcfa164M8tqqnZ
         O0JEOXTZZpYqeyJ6lybhLS11nUVwvmp5yzCegOfjDvyeudecbDVI83JQIaFWnkU5p23A
         +xVS8yzO3mUMhdDJSKbLu7C4vz2Wko3K9B5kuL7bd66o4OJPFn9hUeAQyqTIjK5ilxwN
         t2Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697809804; x=1698414604;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=32e0TnvFTa8JUacaFK/IE2+LyO/I6EvDGwOPgupA6kk=;
        b=EUs2Hgh3IvwS87C5URFa/QKIQ32EtTChoQbXhrjmDOJOHBdIODbijxHYINC94QAYwL
         3gnn/+v5Z60GgJlZ1BpJoLjOpLAXUYwz+3ZPTJz+8m46FmWRBEXgMXFNSob68Y7d+VeZ
         hsSMq+iizBfoX9L/030vKyYNv9n8CS6TZ2JwS/SO6yuWIIQLu/e4gyb4RVG3DPdc9BdV
         LuM9QRt891EmekpqUQF91h9xQe/E6nJfx8aHk6cSXggTmQUPxtWkMNlkXVQFe7M/OWUY
         m//RFeByjEzsssErzOxufydFQhww9maHZxhyvLeVJAyU3U31b3dRwT7t6B9N8ebSnNvO
         S8LQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0Yw67y5HGEV6gtVfdxicjRjDlYiHBp6EeKpb3N2hi/W/Qe/wBnKg
	eLleRamD4XSVXsiwzENrHA8=
X-Google-Smtp-Source: AGHT+IFPU356ADnFz7Bhj8lIHS6g1OuRMUlLfNc1hzAjWAtJcxHPhFqgGKUPoWD4vQQwYGiQTO0rQw==
X-Received: by 2002:a05:6870:1084:b0:1dd:5413:9fad with SMTP id 4-20020a056870108400b001dd54139fadmr1687774oaq.0.1697809803884;
        Fri, 20 Oct 2023 06:50:03 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6870:3d93:b0:1e9:8d46:4019 with SMTP id
 lm19-20020a0568703d9300b001e98d464019ls2019235oab.2.-pod-prod-07-us; Fri, 20
 Oct 2023 06:50:03 -0700 (PDT)
X-Received: by 2002:a05:6870:2197:b0:1e9:b451:bae6 with SMTP id l23-20020a056870219700b001e9b451bae6mr831005oae.1.1697809802774;
        Fri, 20 Oct 2023 06:50:02 -0700 (PDT)
Date: Fri, 20 Oct 2023 06:50:01 -0700 (PDT)
From: Bharathiraja Nallathambi <barathiraja@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <4cf5731e-a3ff-47ca-a1d7-c4f11a9e096bn@googlegroups.com>
In-Reply-To: <3acdd865-1303-4ba1-8c4c-9fc3ca8d2c67@oth-regensburg.de>
References: <CAGA=GbzmH9eiuBrKjVeeKf--5fRFVGxwyCe6D20e4MDn66d3tw@mail.gmail.com>
 <3acdd865-1303-4ba1-8c4c-9fc3ca8d2c67@oth-regensburg.de>
Subject: Re: CPU shows offline - Jailhouse Linux inmate
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_11482_301923632.1697809801796"
X-Original-Sender: barathiraja@gmail.com
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

------=_Part_11482_301923632.1697809801796
Content-Type: multipart/alternative; 
	boundary="----=_Part_11483_1980449143.1697809801796"

------=_Part_11483_1980449143.1697809801796
Content-Type: text/plain; charset="UTF-8"

Hi Ralf,

Thanks for providing the suggestion, with the boot log, we found the below 
message,

*[    0.045828] psci: no cpu_on method, not booting CPU1*

We went on updating the inmate Linux dts with the following node,




*psci { compatible = "arm,psci-1.0"; method = "smc";};*

Now we are able to see both the CPUs enabled and working as expected 

*[    0.003483] CPU1: Booted secondary processor 0x0000000003 [0x410fd083]*

Thanks for the support.

Thanks and Regards,
Bharathiraja Nallathambi

On Wednesday, 11 October 2023 at 01:26:19 UTC+5:30 Ralf Ramsauer wrote:



On 10/10/2023 17:17, Bharathiraja Nallathambi wrote: 
> Hi, 
> 
> I was trying jailhouse with a linux inmate on an imx8mp-evk board. I 
> have created a yocto build with jailhouse and linux kernel 6.1.22-rt8 
> which is having the patches for real time linux. 
> Booted the board with running run '/jh_mmcboot/' in the uboot prompt. 
> 
>  Once logged into the device, I have started the jailhouse by  running, 
> 
> /cd /usr/share/jailhouse/scripts && ./init_jailhouse_env.sh && cp 
> /run/media/boot-mmcblk1p1/Image /usr/share/jailhouse/inmates/kernel/ && 
> ../tools/jailhouse enable ../cells/imx8mp.cell; jailhouse cell list;/ 
> 
>  the above command will load the jailhouse.ko and will enable the 
jailhouse 
> 
> I got the output of 'jailhouse cell list' as, 
> /root@imx8mp-lpddr4-evk:/usr/share/jailhouse/scripts# jailhouse cell list 
> ID      Name                    State             Assigned 
> CPUs           Failed CPUs 
> 0       imx8mp                  running           0-3 / 
> 
>  Then I started the linux inmate, the CPU offset in the cell 
> configuration is 0xc which will assign two cores. I am using the same 
> host kernal image for the inmate also (6.1.22-rt8). Used the below 
> command to start the inmate 
> 
> ../tools/jailhouse cell linux ../cells/imx8mp-linux-demo.cell 
> ../inmates/kernel/Image -d ../inmates/dtb/inmate-imx8mp-evk.dtb -c 
> "clk_ignore_unused console=ttymxc3,115200 
> earlycon=ec_imx6q,0x30890000,115200 root=/dev/mmcblk2p2 rootwait rw"; 
> jailhouse cell list; 
> 
>  I got the output of 'jailhouse cell list' as, 
> 
> /root@imx8mp-lpddr4-evk:/usr/share/jailhouse/scripts# jailhouse cell list 
> ID      Name                    State             Assigned 
> CPUs           Failed CPUs 
> 0       imx8mp                  running           0-1 
> 1       linux-inmate-demo       running           2-3 / 
> 
>  I could login to the inmate using serial console. But the output of 
> 'cat /proc/cpuinfo' is showing only one core. 
> 
> /root@imx8mp-lpddr4-evk:~# cat /proc/cpuinfo 
> processor       : 0 
> BogoMIPS        : 16.66 
> Features        : fp asimd evtstrm aes pmull sha1 sha2 crc32 cpuid 
> CPU implementer : 0x41 
> U architecture: 8 
> CPU variant     : 0x0 
> CPU part        : 0xd03 
> CPU resion      : 4/ 
> 
> the 'nproc --all' is giving 2 
> 
>  It looks like 2 cores are assigned to the inmate but one of the core 
> is offline. 
> 
> / root@imx8mp-lpddr4-evk:/usr/share/jailhouse/scripts# cat 
> /sys/devices/system/cpu/cpu0/online / 
> 
> /1 
> root@imx8mp-lpddr4-evk:/usr/share/jailhouse/scripts# cat 
> /sys/devices/system/cpu/cpu1/online 
> 0/ 
> 
>  Am I doing something wrong? How can I turn on both the CPUS for the 
> inmate. 

What does the non-root Linux kernel console output during boot? Are 
there any error messages that might give you a hint why bringing up 
secondary CPUs failed? 

Ralf 

> 
> Thanks and Regards, 
> Bharathiraja Nallathambi 
> 
> -- 
> You received this message because you are subscribed to the Google 
> Groups "Jailhouse" group. 
> To unsubscribe from this group and stop receiving emails from it, send 
> an email to jailhouse-de...@googlegroups.com 
> <mailto:jailhouse-de...@googlegroups.com>. 
> To view this discussion on the web visit 
> 
https://groups.google.com/d/msgid/jailhouse-dev/CAGA%3DGbzmH9eiuBrKjVeeKf--5fRFVGxwyCe6D20e4MDn66d3tw%40mail.gmail.com 
<
https://groups.google.com/d/msgid/jailhouse-dev/CAGA%3DGbzmH9eiuBrKjVeeKf--5fRFVGxwyCe6D20e4MDn66d3tw%40mail.gmail.com?utm_medium=email&utm_source=footer>. 


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/4cf5731e-a3ff-47ca-a1d7-c4f11a9e096bn%40googlegroups.com.

------=_Part_11483_1980449143.1697809801796
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi=C2=A0<span style=3D"color: rgb(32, 33, 36); font-family: Roboto, Arial, =
sans-serif; letter-spacing: 0.25px; text-wrap: nowrap;">Ralf,</span><div><f=
ont color=3D"#202124" face=3D"Roboto, Arial, sans-serif"><span style=3D"let=
ter-spacing: 0.25px; text-wrap: nowrap;"><br /></span></font></div><div><fo=
nt color=3D"#202124" face=3D"Roboto, Arial, sans-serif"><span style=3D"lett=
er-spacing: 0.25px; text-wrap: nowrap;">Thanks for providing the suggestion=
, with the boot log, we found the below message,<br /></span></font><div><b=
r /></div><div><i>[ =C2=A0 =C2=A00.045828] psci: no cpu_on method, not boot=
ing CPU1</i></div><div><br /></div><div>We went on updating the inmate Linu=
x dts with the following node,</div><div><br /></div><div><i>psci {<br /><s=
pan style=3D"white-space: pre;">	</span>compatible =3D "arm,psci-1.0";<br /=
><span style=3D"white-space: pre;">	</span>method =3D "smc";<br />};</i></d=
iv><div><br /></div><div>Now we are able to see both the CPUs enabled and w=
orking as expected=C2=A0<br /><br /><i>[ =C2=A0 =C2=A00.003483] CPU1: Boote=
d secondary processor 0x0000000003 [0x410fd083]</i><br /><br />Thanks for t=
he support.</div><div><br /></div><div>Thanks and Regards,</div><div>Bharat=
hiraja Nallathambi</div><div><br /></div></div><div><div dir=3D"auto">On We=
dnesday, 11 October 2023 at 01:26:19 UTC+5:30 Ralf Ramsauer wrote:<br /></d=
iv><blockquote style=3D"margin: 0px 0px 0px 0.8ex; border-left: 1px solid r=
gb(204, 204, 204); padding-left: 1ex;">
<br />
<br />On 10/10/2023 17:17, Bharathiraja Nallathambi wrote:
<br />&gt; Hi,
<br />&gt;=20
<br />&gt; I was trying jailhouse with a linux inmate on an imx8mp-evk boar=
d. I=20
<br />&gt; have created a yocto build with jailhouse and linux kernel 6.1.2=
2-rt8=20
<br />&gt; which is having the patches for real time linux.
<br />&gt; Booted the board with running run '/jh_mmcboot/' in the uboot pr=
ompt.
<br />&gt;=20
<br />&gt;  =C2=A0Once logged into the device, I have started the jailhouse=
 by=C2=A0 running,
<br />&gt;=20
<br />&gt; /cd /usr/share/jailhouse/scripts &amp;&amp; ./init_jailhouse_env=
.sh &amp;&amp; cp=20
<br />&gt; /run/media/boot-mmcblk1p1/Image /usr/share/jailhouse/inmates/ker=
nel/ &amp;&amp;=20
<br />&gt; ../tools/jailhouse enable ../cells/imx8mp.cell; jailhouse cell l=
ist;/
<br />&gt;=20
<br />&gt;  =C2=A0the above command will load the jailhouse.ko and will ena=
ble the jailhouse
<br />&gt;=20
<br />&gt; I got the output of 'jailhouse cell list' as,
<br />&gt; /root@imx8mp-lpddr4-evk:/usr/share/jailhouse/scripts# jailhouse =
cell list
<br />&gt; ID=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Name=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 State=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 Assigned=20
<br />&gt; CPUs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 Failed CPUs
<br />&gt; 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 imx8mp=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 running=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0-3 /
<br />&gt;=20
<br />&gt;  =C2=A0Then I started the linux inmate, the CPU offset in the ce=
ll=20
<br />&gt; configuration is 0xc which will assign two cores. I am using the=
 same=20
<br />&gt; host kernal image for the inmate also (6.1.22-rt8). Used the bel=
ow=20
<br />&gt; command to start the inmate
<br />&gt;=20
<br />&gt; ../tools/jailhouse cell linux ../cells/imx8mp-linux-demo.cell=20
<br />&gt; ../inmates/kernel/Image -d ../inmates/dtb/inmate-imx8mp-evk.dtb =
-c=20
<br />&gt; "clk_ignore_unused console=3Dttymxc3,115200=20
<br />&gt; earlycon=3Dec_imx6q,0x30890000,115200 root=3D/dev/mmcblk2p2 root=
wait rw";=20
<br />&gt; jailhouse cell list;
<br />&gt;=20
<br />&gt;  =C2=A0I got the output of 'jailhouse cell list' as,
<br />&gt;=20
<br />&gt; /root@imx8mp-lpddr4-evk:/usr/share/jailhouse/scripts# jailhouse =
cell list
<br />&gt; ID=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Name=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 State=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 Assigned=20
<br />&gt; CPUs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 Failed CPUs
<br />&gt; 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 imx8mp=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 running=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0-1
<br />&gt; 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 linux-inmate-demo=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 running=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 2-3 /
<br />&gt;=20
<br />&gt;  =C2=A0I could login to the inmate using serial console. But the=
 output of=20
<br />&gt; 'cat /proc/cpuinfo' is showing only one core.
<br />&gt;=20
<br />&gt; /root@imx8mp-lpddr4-evk:~# cat /proc/cpuinfo
<br />&gt; processor=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : 0
<br />&gt; BogoMIPS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : 16.66
<br />&gt; Features=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : fp asimd ev=
tstrm aes pmull sha1 sha2 crc32 cpuid
<br />&gt; CPU implementer : 0x41
<br />&gt; U architecture: 8
<br />&gt; CPU variant=C2=A0=C2=A0=C2=A0=C2=A0 : 0x0
<br />&gt; CPU part=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : 0xd03
<br />&gt; CPU resion=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : 4/
<br />&gt;=20
<br />&gt; the 'nproc --all' is giving 2
<br />&gt;=20
<br />&gt;  =C2=A0It looks like 2 cores are assigned to the inmate but one =
of the core=20
<br />&gt; is offline.
<br />&gt;=20
<br />&gt; /=C2=A0root@imx8mp-lpddr4-evk:/usr/share/jailhouse/scripts# cat=
=20
<br />&gt; /sys/devices/system/cpu/cpu0/online /
<br />&gt;=20
<br />&gt; /1
<br />&gt; root@imx8mp-lpddr4-evk:/usr/share/jailhouse/scripts# cat=20
<br />&gt; /sys/devices/system/cpu/cpu1/online
<br />&gt; 0/
<br />&gt;=20
<br />&gt;  =C2=A0Am I doing something wrong? How can I turn on both the CP=
US for the=20
<br />&gt; inmate.
<br />
<br />What does the non-root Linux kernel console output during boot? Are=
=20
<br />there any error messages that might give you a hint why bringing up=
=20
<br />secondary CPUs failed?
<br />
<br />   Ralf
<br />
<br />&gt;=20
<br />&gt; Thanks and Regards,
<br />&gt; Bharathiraja Nallathambi
<br />&gt;=20
<br />&gt; --=20
<br />&gt; You received this message because you are subscribed to the Goog=
le=20
<br />&gt; Groups "Jailhouse" group.
<br />&gt; To unsubscribe from this group and stop receiving emails from it=
, send=20
<br />&gt; an email to <a href=3D"" rel=3D"nofollow">jailhouse-de...@google=
groups.com</a>=20
<br />&gt; &lt;mailto:<a href=3D"" rel=3D"nofollow">jailhouse-de...@googleg=
roups.com</a>&gt;.
<br />&gt; To view this discussion on the web visit=20
<br />&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/CAGA%=
3DGbzmH9eiuBrKjVeeKf--5fRFVGxwyCe6D20e4MDn66d3tw%40mail.gmail.com" target=
=3D"_blank" rel=3D"nofollow">https://groups.google.com/d/msgid/jailhouse-de=
v/CAGA%3DGbzmH9eiuBrKjVeeKf--5fRFVGxwyCe6D20e4MDn66d3tw%40mail.gmail.com</a=
> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/CAGA%3DGbz=
mH9eiuBrKjVeeKf--5fRFVGxwyCe6D20e4MDn66d3tw%40mail.gmail.com?utm_medium=3De=
mail&amp;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow">https://gr=
oups.google.com/d/msgid/jailhouse-dev/CAGA%3DGbzmH9eiuBrKjVeeKf--5fRFVGxwyC=
e6D20e4MDn66d3tw%40mail.gmail.com?utm_medium=3Demail&amp;utm_source=3Dfoote=
r</a>&gt;.
<br /></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/4cf5731e-a3ff-47ca-a1d7-c4f11a9e096bn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/4cf5731e-a3ff-47ca-a1d7-c4f11a9e096bn%40googlegroups.co=
m</a>.<br />

------=_Part_11483_1980449143.1697809801796--

------=_Part_11482_301923632.1697809801796--
