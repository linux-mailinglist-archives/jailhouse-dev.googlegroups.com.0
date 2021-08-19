Return-Path: <jailhouse-dev+bncBC653PXTYYERBZFM7GEAMGQE4Y7LXTY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73b.google.com (mail-qk1-x73b.google.com [IPv6:2607:f8b0:4864:20::73b])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F383F19EA
	for <lists+jailhouse-dev@lfdr.de>; Thu, 19 Aug 2021 15:02:29 +0200 (CEST)
Received: by mail-qk1-x73b.google.com with SMTP id b4-20020a3799040000b02903b899a4309csf4093008qke.14
        for <lists+jailhouse-dev@lfdr.de>; Thu, 19 Aug 2021 06:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=yZvR5pxfYfulvWLjxL8TELTwOBFW4AGYpHedX4haTPo=;
        b=hM14mm0JXkOOGjB2lF8aOcpU/kSd28JxFZiGhvFlyHOuMP1CIf+Bq2HcDKB9UM4gzf
         kCrZXx+avQmdztVdDpCUrxtgNORbftnBdlaYVK2yyol4OAxPZitxNmLxZTk8YP+k2s6V
         E0mr0kaoDgp/zLJMGdAmJfA9HY7i814Jm2KHRJOKOomqmSK77zcTIkrpk1ty/5GGUqYI
         +6VooQ9k45YFc2Di4FIeUouWktTBhf1kzmvZlW09jlhqCObeDKMcRXn8/SdFp6Lttr/w
         c0C+zmoCuxWLIw4OOScN+w0lc0j3Rq2TLaRo0VE/4OjPW8qMQfvSaeXn3luwzBnNz3NL
         BEIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=yZvR5pxfYfulvWLjxL8TELTwOBFW4AGYpHedX4haTPo=;
        b=B+Z5aubIZxuWufRdpTlp/E00yUecV6fuqg5IMe4xWKlyl9D+ZiqInunlTFwa+rS9TQ
         4MYNR/bv9Q3/+jTj6cN4XLRx3ktvc72rmRsVR9SBTN1h7c0dzFBOom5JBA+dgmbAfcCx
         j7ZmSByY+o3CtuXd3rTs0nRMl3uWdYlWVKg/9V2LLM9stP2GjzTywmUJ0DGd9hNiD0eT
         UKdQ+SAREtF88mzl8dYRCBR8kaGVTv+YlgSXPM0wE5G2aqfuShJtuw2MnX4x6lWE7lnz
         wuhdLpPYfSAUg3hGcDtlGGeTL8TsN3XuttdgYPQru6NjppCh22eA5qUtdraaqt4QE0JQ
         R4Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=yZvR5pxfYfulvWLjxL8TELTwOBFW4AGYpHedX4haTPo=;
        b=Kyl6JYOCkzHoCrRgL8Gp1rL1VI0kqZCJLnbL86Y+Q65I2cfETjotTNmeTMA1Z6x//X
         DCNXXeT72Pe96cZWVlEQ/piF3dqqseTgmOeLAEqsFB9dRknTVIhQEsyQiYB0w45VEkRJ
         QftM9+VDb2+ooQ8SHUx1S9BNSY9bMRlrJI8P7SPEkUz7cNMFVnoThJKDOV6+bpurdnCM
         0g2CTgz+OifK6GK5NPTgsI3UW2wLOm1WketKnGGc8XGXAnuwgL74Zx3mD9ExlCE50Kj5
         c18xV/hNJF8yhko/7QiOg9hyOYA6emPd5J/epz5shMPvEw22zud7a3+nOZteNT48LnWS
         aC1g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532SokVOcm/zzotcL5Zodz38Ur7CtaLo6pE8oJEJS6JY5Bg5ARUE
	7vhJS8T8/l9jf3xQbku1/f0=
X-Google-Smtp-Source: ABdhPJzlkbzqmLthG+8fkzLhOmafSqIdfbVMv1AE8sdnSHGmX9TadNVuTYk9M6lbWOLdf4XI4IXvCg==
X-Received: by 2002:a37:8747:: with SMTP id j68mr3619315qkd.165.1629378148597;
        Thu, 19 Aug 2021 06:02:28 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ae9:d619:: with SMTP id r25ls1588450qkk.3.gmail; Thu, 19 Aug
 2021 06:02:28 -0700 (PDT)
X-Received: by 2002:a37:b6c1:: with SMTP id g184mr3563424qkf.270.1629378147853;
        Thu, 19 Aug 2021 06:02:27 -0700 (PDT)
Date: Thu, 19 Aug 2021 06:02:27 -0700 (PDT)
From: Moustafa Nofal <mustafa13e09940@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <0210ece8-a149-4335-ba45-bacaa6021a20n@googlegroups.com>
In-Reply-To: <5d346985-f668-4940-8f6f-520f72cf1842o@googlegroups.com>
References: <375baf50-dcb2-486b-9ddf-3de231f22ea8o@googlegroups.com>
 <eb8f71d2-b861-4136-2968-fa2407c7207a@siemens.com>
 <5d346985-f668-4940-8f6f-520f72cf1842o@googlegroups.com>
Subject: Re: error: implicit declaration of function 'cpu_down'
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_430_946088511.1629378147294"
X-Original-Sender: mustafa13e09940@gmail.com
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

------=_Part_430_946088511.1629378147294
Content-Type: multipart/alternative; 
	boundary="----=_Part_431_849253667.1629378147294"

------=_Part_431_849253667.1629378147294
Content-Type: text/plain; charset="UTF-8"

Jailhouse uses cpu_down identifier so,  CONFIG_HOTPLUG_CPU  is necessary. 

On Friday, 17 July 2020 at 14:15:54 UTC+2 Parth Dode wrote:

> How did you figure that out?
>
>
> On Friday, July 17, 2020 at 11:37:23 AM UTC+5:30, Jan Kiszka wrote:
>>
>> On 17.07.20 05:13, Parth Dode wrote: 
>> > I am using  yocto to build jailhouse module in agl   for rpi4 . 
>> > This is the error Im getting, please help figure out 
>> > 
>> > NOTE: Tasks Summary: Attempted 1466 tasks of which 1465 didn't need to 
>> > be rerun and 1 failed. 
>> > 
>> > Summary: 1 task failed: 
>> > 
>> /home/parth/meta-yocto-jailhouse-rpi4/recipes-kernel/jailhouse/jailhouse_git.bb:do_compile 
>>
>> > Summary: There were 2 WARNING messages shown. 
>> > Summary: There were 2 ERROR messages shown, returning a non-zero exit 
>> code. 
>> > parth@Debian-95-stretch-64-minimal:~/meta-yocto-jailhouse-rpi4$ 
>> > x/9.3.0/include 
>> > 
>> -I/home/parth/AGL/build-agl-jailhouse-rpi/tmp/work-shared/raspberrypi4-64/kernel- 
>>
>> > source/arch/arm64/include -I./arch/arm64/include/generated 
>> > -I/home/parth/AGL/build-agl-jailhouse 
>> > -rpi/tmp/work-shared/raspberrypi4-64/kernel-source/include -I./include 
>> > -I/home/parth/AGL/build-ag 
>> > 
>> l-jailhouse-rpi/tmp/work-shared/raspberrypi4-64/kernel-source/arch/arm64/include/uapi 
>>
>> > -I./arch/ar 
>> > m64/include/generated/uapi 
>> > -I/home/parth/AGL/build-agl-jailhouse-rpi/tmp/work-shared/raspberrypi4 
>> > -64/kernel-source/include/uapi -I./include/generated/uapi -include 
>> > /home/parth/AGL/build-agl-jail 
>> > 
>> house-rpi/tmp/work-shared/raspberrypi4-64/kernel-source/include/linux/kconfig.h 
>>
>> > -D__KERNEL__ -mli 
>> > ttle-endian -D__ASSEMBLY__ -fno-PIE -DCONFIG_AS_LSE=1 -mabi=lp64 
>> > -Wa,-gdwarf-2 -DMODULE -c -o /h 
>> > 
>> ome/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_64-agl-linux/jailhouse/0.12+gitAUTOIN 
>>
>> > C+4ce7658ddd-r0/git/driver/vpci_template.dtb.o 
>> > /home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/r 
>> > 
>> aspberrypi4_64-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/driver/vpci_template.dtb.S 
>>
>> > | (cat /dev/null; ) > 
>> > 
>> /home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_64-agl-linux/ 
>> > jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/tools/modules.order 
>> > | 
>> > 
>> /home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_64-agl-linux/jailhouse/0.12+gitAU 
>>
>> > TOINC+4ce7658ddd-r0/git/driver/cell.c: In function 
>> > 'jailhouse_cmd_cell_create': 
>> > | 
>> > 
>> /home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_64-agl-linux/jailhouse/0.12+gitAU 
>>
>> > TOINC+4ce7658ddd-r0/git/driver/cell.c:31:26: error: implicit 
>> declaration 
>> > of function 'cpu_down' [ 
>> > -Werror=implicit-function-declaration] 
>> > | 31 | #define remove_cpu(cpu) cpu_down(cpu) 
>> > | | ^~~~~~~~ 
>> > | 
>> > 
>> /home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_64-agl-linux/jailhouse/0.12+gitAU 
>>
>> > TOINC+4ce7658ddd-r0/git/driver/cell.c:243:10: note: in expansion of 
>> > macro 'remove_cpu' 
>> > | 243 | err = remove_cpu(cpu); 
>> > | | ^~~~~~~~~~ 
>> > | if [ "-pg" = "-pg" ]; then if [ 
>> > /home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4 
>> > 
>> _64-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/driver/sysfs.o 
>> > != "scripts/mod/empty.o" 
>> > ]; then ./scripts/recordmcount 
>> > "/home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_6 
>> > 
>> 4-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/driver/sysfs.o"; 
>> > fi; fi; 
>> > | cc1: all warnings being treated as errors 
>> > | make[5]: *** 
>> > 
>> [/home/parth/AGL/build-agl-jailhouse-rpi/tmp/work-shared/raspberrypi4-64/kernel-so 
>>
>> > urce/scripts/Makefile.build:303: 
>> > /home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_64 
>> > -agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/driver/cell.o] 
>> > Error 1 
>> > | make[5]: *** Waiting for unfinished jobs.... 
>> > | if [ "-pg" = "-pg" ]; then if [ 
>> > /home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4 
>> > _64-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/driver/pci.o 
>> > != "scripts/mod/empty.o" ] 
>> > ; then ./scripts/recordmcount 
>> > 
>> "/home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_64-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/driver/pci.o"; 
>>
>> > fi; fi; 
>> > | make[4]: *** 
>> > 
>> [/home/parth/AGL/build-agl-jailhouse-rpi/tmp/work-shared/raspberrypi4-64/kernel-source/scripts/Makefile.build:544: 
>>
>> > 
>> /home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_64-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/driver] 
>>
>> > Error 2 
>> > | make[3]: *** 
>> > 
>> [/home/parth/AGL/build-agl-jailhouse-rpi/tmp/work-shared/raspberrypi4-64/kernel-source/Makefile:1527: 
>>
>> > 
>> _module_/home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_64-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git] 
>>
>> > Error 2 
>> > | make[2]: *** [Makefile:146: sub-make] Error 2 
>> > | make[1]: *** [Makefile:24: __sub-make] Error 2 
>> > | make: *** [Makefile:40: modules] Error 2 
>> > | WARNING: 
>> > 
>> /home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_64-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/temp/run.do_compile.24833:1 
>>
>> > exit 1 from 'exit 1' 
>> > | 
>> > ERROR: Task 
>> > 
>> (/home/parth/meta-yocto-jailhouse-rpi4/recipes-kernel/jailhouse/jailhouse_git.bb:do_compile) 
>>
>> > failed with exit code '1' 
>> > NOTE: Tasks Summary: Attempted 1466 tasks of which 1465 didn't need to 
>> > be rerun and 1 failed. 
>> > 
>> > Summary: 1 task failed: 
>> > 
>> /home/parth/meta-yocto-jailhouse-rpi4/recipes-kernel/jailhouse/jailhouse_git.bb:do_compile 
>>
>> > Summary: There were 2 WARNING messages shown. 
>> > Summary: There were 2 ERROR messages shown, returning a non-zero exit 
>> code. 
>> > 
>>
>> I suspect your target kernel lacks CONFIG_HOTPLUG_CPU=y. See 
>> jailhouse-images for a know-to-work reference config. 
>>
>> Also note that you will need an ATF-based boot on the RPi4, just in case 
>> you didn't spot that dependency yet. Again, jailhouse-images is the 
>> reference. 
>>
>> Jan 
>>
>> -- 
>> Siemens AG, Corporate Technology, CT RDA IOT SES-DE 
>> Corporate Competence Center Embedded Linux 
>>
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0210ece8-a149-4335-ba45-bacaa6021a20n%40googlegroups.com.

------=_Part_431_849253667.1629378147294
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jailhouse uses cpu_down identifier so,&nbsp;

CONFIG_HOTPLUG_CPU&nbsp; is necessary.&nbsp;<br><br><div class=3D"gmail_quo=
te"><div dir=3D"auto" class=3D"gmail_attr">On Friday, 17 July 2020 at 14:15=
:54 UTC+2 Parth Dode wrote:<br/></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); paddi=
ng-left: 1ex;"><div dir=3D"ltr">How did you figure that out?</div><div dir=
=3D"ltr"><div><br><br>On Friday, July 17, 2020 at 11:37:23 AM UTC+5:30, Jan=
 Kiszka wrote:<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 17.07.20=
 05:13, Parth Dode wrote:
<br>&gt; I am using=C2=A0 yocto to build jailhouse module in agl=C2=A0 =C2=
=A0for rpi4 .
<br>&gt; This is the error Im getting, please help figure out
<br>&gt;=20
<br>&gt; NOTE: Tasks Summary: Attempted 1466 tasks of which 1465 didn&#39;t=
 need to=20
<br>&gt; be rerun and 1 failed.
<br>&gt;=20
<br>&gt; Summary: 1 task failed:
<br>&gt; /home/parth/meta-yocto-jailhouse-rpi4/recipes-kernel/jailhouse/jai=
lhouse_git.bb:do_compile
<br>&gt; Summary: There were 2 WARNING messages shown.
<br>&gt; Summary: There were 2 ERROR messages shown, returning a non-zero e=
xit code.
<br>&gt; parth@Debian-95-stretch-64-minimal:~/meta-yocto-jailhouse-rpi4$
<br>&gt; x/9.3.0/include=20
<br>&gt; -I/home/parth/AGL/build-agl-jailhouse-rpi/tmp/work-shared/raspberr=
ypi4-64/kernel-
<br>&gt; source/arch/arm64/include -I./arch/arm64/include/generated=20
<br>&gt; -I/home/parth/AGL/build-agl-jailhouse
<br>&gt; -rpi/tmp/work-shared/raspberrypi4-64/kernel-source/include -I./inc=
lude=20
<br>&gt; -I/home/parth/AGL/build-ag
<br>&gt; l-jailhouse-rpi/tmp/work-shared/raspberrypi4-64/kernel-source/arch=
/arm64/include/uapi=20
<br>&gt; -I./arch/ar
<br>&gt; m64/include/generated/uapi=20
<br>&gt; -I/home/parth/AGL/build-agl-jailhouse-rpi/tmp/work-shared/raspberr=
ypi4
<br>&gt; -64/kernel-source/include/uapi -I./include/generated/uapi -include=
=20
<br>&gt; /home/parth/AGL/build-agl-jail
<br>&gt; house-rpi/tmp/work-shared/raspberrypi4-64/kernel-source/include/li=
nux/kconfig.h=20
<br>&gt; -D__KERNEL__ -mli
<br>&gt; ttle-endian -D__ASSEMBLY__ -fno-PIE -DCONFIG_AS_LSE=3D1 -mabi=3Dlp=
64=20
<br>&gt; -Wa,-gdwarf-2 -DMODULE -c -o /h
<br>&gt; ome/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_64-agl=
-linux/jailhouse/0.12+gitAUTOIN
<br>&gt; C+4ce7658ddd-r0/git/driver/vpci_template.dtb.o=20
<br>&gt; /home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/r
<br>&gt; aspberrypi4_64-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/g=
it/driver/vpci_template.dtb.S
<br>&gt; | (cat /dev/null; ) &gt;=20
<br>&gt; /home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_64-a=
gl-linux/
<br>&gt; jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/tools/modules.order
<br>&gt; |=20
<br>&gt; /home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_64-a=
gl-linux/jailhouse/0.12+gitAU
<br>&gt; TOINC+4ce7658ddd-r0/git/driver/cell.c: In function=20
<br>&gt; &#39;jailhouse_cmd_cell_create&#39;:
<br>&gt; |=20
<br>&gt; /home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_64-a=
gl-linux/jailhouse/0.12+gitAU
<br>&gt; TOINC+4ce7658ddd-r0/git/driver/cell.c:31:26: error: implicit decla=
ration=20
<br>&gt; of function &#39;cpu_down&#39; [
<br>&gt; -Werror=3Dimplicit-function-declaration]
<br>&gt; | 31 | #define remove_cpu(cpu) cpu_down(cpu)
<br>&gt; | | ^~~~~~~~
<br>&gt; |=20
<br>&gt; /home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_64-a=
gl-linux/jailhouse/0.12+gitAU
<br>&gt; TOINC+4ce7658ddd-r0/git/driver/cell.c:243:10: note: in expansion o=
f=20
<br>&gt; macro &#39;remove_cpu&#39;
<br>&gt; | 243 | err =3D remove_cpu(cpu);
<br>&gt; | | ^~~~~~~~~~
<br>&gt; | if [ &quot;-pg&quot; =3D &quot;-pg&quot; ]; then if [=20
<br>&gt; /home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4
<br>&gt; _64-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/driver/s=
ysfs.o=20
<br>&gt; !=3D &quot;scripts/mod/empty.o&quot;
<br>&gt; ]; then ./scripts/recordmcount=20
<br>&gt; &quot;/home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi=
4_6
<br>&gt; 4-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/driver/sys=
fs.o&quot;;=20
<br>&gt; fi; fi;
<br>&gt; | cc1: all warnings being treated as errors
<br>&gt; | make[5]: ***=20
<br>&gt; [/home/parth/AGL/build-agl-jailhouse-rpi/tmp/work-shared/raspberry=
pi4-64/kernel-so
<br>&gt; urce/scripts/Makefile.build:303:=20
<br>&gt; /home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_64
<br>&gt; -agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/driver/cell=
.o]=20
<br>&gt; Error 1
<br>&gt; | make[5]: *** Waiting for unfinished jobs....
<br>&gt; | if [ &quot;-pg&quot; =3D &quot;-pg&quot; ]; then if [=20
<br>&gt; /home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4
<br>&gt; _64-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/driver/p=
ci.o=20
<br>&gt; !=3D &quot;scripts/mod/empty.o&quot; ]
<br>&gt; ; then ./scripts/recordmcount=20
<br>&gt; &quot;/home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi=
4_64-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/driver/pci.o&quo=
t;;=20
<br>&gt; fi; fi;
<br>&gt; | make[4]: ***=20
<br>&gt; [/home/parth/AGL/build-agl-jailhouse-rpi/tmp/work-shared/raspberry=
pi4-64/kernel-source/scripts/Makefile.build:544:=20
<br>&gt; /home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_64-a=
gl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/driver]=20
<br>&gt; Error 2
<br>&gt; | make[3]: ***=20
<br>&gt; [/home/parth/AGL/build-agl-jailhouse-rpi/tmp/work-shared/raspberry=
pi4-64/kernel-source/Makefile:1527:=20
<br>&gt; _module_/home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberry=
pi4_64-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git]=20
<br>&gt; Error 2
<br>&gt; | make[2]: *** [Makefile:146: sub-make] Error 2
<br>&gt; | make[1]: *** [Makefile:24: __sub-make] Error 2
<br>&gt; | make: *** [Makefile:40: modules] Error 2
<br>&gt; | WARNING:=20
<br>&gt; /home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_64-a=
gl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/temp/run.do_compile.24833:=
1=20
<br>&gt; exit 1 from &#39;exit 1&#39;
<br>&gt; |
<br>&gt; ERROR: Task=20
<br>&gt; (/home/parth/meta-yocto-jailhouse-rpi4/recipes-kernel/jailhouse/ja=
ilhouse_git.bb:do_compile)=20
<br>&gt; failed with exit code &#39;1&#39;
<br>&gt; NOTE: Tasks Summary: Attempted 1466 tasks of which 1465 didn&#39;t=
 need to=20
<br>&gt; be rerun and 1 failed.
<br>&gt;=20
<br>&gt; Summary: 1 task failed:
<br>&gt; /home/parth/meta-yocto-jailhouse-rpi4/recipes-kernel/jailhouse/jai=
lhouse_git.bb:do_compile
<br>&gt; Summary: There were 2 WARNING messages shown.
<br>&gt; Summary: There were 2 ERROR messages shown, returning a non-zero e=
xit code.
<br>&gt;=20
<br>
<br>I suspect your target kernel lacks CONFIG_HOTPLUG_CPU=3Dy. See=20
<br>jailhouse-images for a know-to-work reference config.
<br>
<br>Also note that you will need an ATF-based boot on the RPi4, just in cas=
e=20
<br>you didn&#39;t spot that dependency yet. Again, jailhouse-images is the=
=20
<br>reference.
<br>
<br>Jan
<br>
<br>--=20
<br>Siemens AG, Corporate Technology, CT RDA IOT SES-DE
<br>Corporate Competence Center Embedded Linux
<br></blockquote></div></div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/0210ece8-a149-4335-ba45-bacaa6021a20n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/0210ece8-a149-4335-ba45-bacaa6021a20n%40googlegroups.co=
m</a>.<br />

------=_Part_431_849253667.1629378147294--

------=_Part_430_946088511.1629378147294--
