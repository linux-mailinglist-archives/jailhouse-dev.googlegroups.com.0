Return-Path: <jailhouse-dev+bncBDSMF24UTUGRB65MY34AKGQEOMV3O6Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x339.google.com (mail-ot1-x339.google.com [IPv6:2607:f8b0:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A774223B37
	for <lists+jailhouse-dev@lfdr.de>; Fri, 17 Jul 2020 14:15:57 +0200 (CEST)
Received: by mail-ot1-x339.google.com with SMTP id x12sf4171647oto.19
        for <lists+jailhouse-dev@lfdr.de>; Fri, 17 Jul 2020 05:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=100qsDRzKMUdms6ZO3o+bUo1BJPsQCV+vs/LSGbuXfE=;
        b=fICInxYux+7/pJli4ZTFN6PFlyDHv8rGlV/o6CViQzDDHOQpfnja+WR4ccMhEb09ng
         fJEY7RtoSlHiIQJKY3nd/hDlVr9qY3RK0PPkM7L4xIYOoErW4+zX3oQ1GQVGNSMJF7lK
         QryAhuOEhIM6KFIeQ7MwQ2roW0Ifwq75UoSEV8m1/QbyZy9P+Dg7j2mRR2BSnP7UULEI
         W48IwPohuBHE65XlQtA9L51pBhiaHFUCKk4mlv0E6706w/e+aR8LRLVZHoHvBpkRLf44
         b8rabPHLXXGXcdn/SioTwri4jAgne582v9RLW130XOZV7yfnmCnBhMQDFvDY1T8DTrfz
         w+HQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=100qsDRzKMUdms6ZO3o+bUo1BJPsQCV+vs/LSGbuXfE=;
        b=SmY84WIN5UTMibNgOMkxwSDAWyR3hk9Ene6xv7fMUljSMK771ZcpNky0EGcPioXI33
         Qmmx7YNEhI7KGTlbcXLTo2vS28HAa115A11U3lDDBtQU/Hl//lGwqNl5nI8zqYSzj9Z+
         1xJzNHX8n4t6spT+ob4K8XZF1aurr3BGPgAEjW4eeVH6jQ3s9jGEo/FD7SPpL3nykcDV
         b57Jx9/ym5JC5eq2Vwam7dEhsWF8qGw4VViD2cyjPX0QhFlMXjZhWXKT6uB3QMB/KNpA
         nx9zpB7URZSMKpZBi+4mRsslMguG9sTCeLuNU0lt4h8h3pblkL6ziYUbjBdRr+U72adF
         HnJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=100qsDRzKMUdms6ZO3o+bUo1BJPsQCV+vs/LSGbuXfE=;
        b=UuLP8ixAqBWlh3FZv+XJ2wuVvxZa6YWxAauTQKBOcIqkmMP9ZAw4/8OrN9uqo7JTpQ
         tI7xaqR5C/gZE7lDz/IP/lu6hf20KWR2CEBXiD4B4RqUKcIkd0oXyqZxkzHhwVahC+vf
         CfMImHtQ3yPu1r0WQBIU1Uh/8d4mx6qbkHrrc+/5+Dfo0iVwjvnxGWibTE4j0t8YjUhw
         vrq1Y7hdpLNvPGaP1h5ZW/xnIFUn9pN5kYijSOggkXXZMegyu2OMm6XMj5q/TRPfCZOX
         /w5QRbMgKtNqvdTyQGalT7maUbTGmW8rExOASjP9v6sqREnwJyJTrMEIEKIL2KKceCWF
         vstA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5305U8fOpyDIcxytdA4hqfq/6VXh0dZck5UohFGkPuzPXZTQ3BSP
	+x9KGJhvh9O9ry2JbDIJKxw=
X-Google-Smtp-Source: ABdhPJw856DEQsypqqpbY/6ajDH+EJpfliMJUOL6MB5PoO0jKvTel/lh2SDbtis+p0KuflEbO3E3Ig==
X-Received: by 2002:a05:6830:1093:: with SMTP id y19mr8707399oto.204.1594988156036;
        Fri, 17 Jul 2020 05:15:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6830:3116:: with SMTP id b22ls1531600ots.6.gmail; Fri,
 17 Jul 2020 05:15:55 -0700 (PDT)
X-Received: by 2002:a9d:7d93:: with SMTP id j19mr7730262otn.150.1594988155211;
        Fri, 17 Jul 2020 05:15:55 -0700 (PDT)
Date: Fri, 17 Jul 2020 05:15:54 -0700 (PDT)
From: Parth Dode <dodecoder@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <5d346985-f668-4940-8f6f-520f72cf1842o@googlegroups.com>
In-Reply-To: <eb8f71d2-b861-4136-2968-fa2407c7207a@siemens.com>
References: <375baf50-dcb2-486b-9ddf-3de231f22ea8o@googlegroups.com>
 <eb8f71d2-b861-4136-2968-fa2407c7207a@siemens.com>
Subject: Re: error: implicit declaration of function 'cpu_down'
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2795_2119338829.1594988154589"
X-Original-Sender: dodecoder@gmail.com
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

------=_Part_2795_2119338829.1594988154589
Content-Type: multipart/alternative; 
	boundary="----=_Part_2796_541743720.1594988154590"

------=_Part_2796_541743720.1594988154590
Content-Type: text/plain; charset="UTF-8"

How did you figure that out?


On Friday, July 17, 2020 at 11:37:23 AM UTC+5:30, Jan Kiszka wrote:
>
> On 17.07.20 05:13, Parth Dode wrote: 
> > I am using  yocto to build jailhouse module in agl   for rpi4 . 
> > This is the error Im getting, please help figure out 
> > 
> > NOTE: Tasks Summary: Attempted 1466 tasks of which 1465 didn't need to 
> > be rerun and 1 failed. 
> > 
> > Summary: 1 task failed: 
> > 
> /home/parth/meta-yocto-jailhouse-rpi4/recipes-kernel/jailhouse/jailhouse_git.bb:do_compile 
>
> > Summary: There were 2 WARNING messages shown. 
> > Summary: There were 2 ERROR messages shown, returning a non-zero exit 
> code. 
> > parth@Debian-95-stretch-64-minimal:~/meta-yocto-jailhouse-rpi4$ 
> > x/9.3.0/include 
> > 
> -I/home/parth/AGL/build-agl-jailhouse-rpi/tmp/work-shared/raspberrypi4-64/kernel- 
>
> > source/arch/arm64/include -I./arch/arm64/include/generated 
> > -I/home/parth/AGL/build-agl-jailhouse 
> > -rpi/tmp/work-shared/raspberrypi4-64/kernel-source/include -I./include 
> > -I/home/parth/AGL/build-ag 
> > 
> l-jailhouse-rpi/tmp/work-shared/raspberrypi4-64/kernel-source/arch/arm64/include/uapi 
>
> > -I./arch/ar 
> > m64/include/generated/uapi 
> > -I/home/parth/AGL/build-agl-jailhouse-rpi/tmp/work-shared/raspberrypi4 
> > -64/kernel-source/include/uapi -I./include/generated/uapi -include 
> > /home/parth/AGL/build-agl-jail 
> > 
> house-rpi/tmp/work-shared/raspberrypi4-64/kernel-source/include/linux/kconfig.h 
>
> > -D__KERNEL__ -mli 
> > ttle-endian -D__ASSEMBLY__ -fno-PIE -DCONFIG_AS_LSE=1 -mabi=lp64 
> > -Wa,-gdwarf-2 -DMODULE -c -o /h 
> > 
> ome/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_64-agl-linux/jailhouse/0.12+gitAUTOIN 
>
> > C+4ce7658ddd-r0/git/driver/vpci_template.dtb.o 
> > /home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/r 
> > 
> aspberrypi4_64-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/driver/vpci_template.dtb.S 
>
> > | (cat /dev/null; ) > 
> > 
> /home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_64-agl-linux/ 
> > jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/tools/modules.order 
> > | 
> > 
> /home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_64-agl-linux/jailhouse/0.12+gitAU 
>
> > TOINC+4ce7658ddd-r0/git/driver/cell.c: In function 
> > 'jailhouse_cmd_cell_create': 
> > | 
> > 
> /home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_64-agl-linux/jailhouse/0.12+gitAU 
>
> > TOINC+4ce7658ddd-r0/git/driver/cell.c:31:26: error: implicit declaration 
> > of function 'cpu_down' [ 
> > -Werror=implicit-function-declaration] 
> > | 31 | #define remove_cpu(cpu) cpu_down(cpu) 
> > | | ^~~~~~~~ 
> > | 
> > 
> /home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_64-agl-linux/jailhouse/0.12+gitAU 
>
> > TOINC+4ce7658ddd-r0/git/driver/cell.c:243:10: note: in expansion of 
> > macro 'remove_cpu' 
> > | 243 | err = remove_cpu(cpu); 
> > | | ^~~~~~~~~~ 
> > | if [ "-pg" = "-pg" ]; then if [ 
> > /home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4 
> > _64-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/driver/sysfs.o 
> > != "scripts/mod/empty.o" 
> > ]; then ./scripts/recordmcount 
> > "/home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_6 
> > 4-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/driver/sysfs.o"; 
> > fi; fi; 
> > | cc1: all warnings being treated as errors 
> > | make[5]: *** 
> > 
> [/home/parth/AGL/build-agl-jailhouse-rpi/tmp/work-shared/raspberrypi4-64/kernel-so 
>
> > urce/scripts/Makefile.build:303: 
> > /home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_64 
> > -agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/driver/cell.o] 
> > Error 1 
> > | make[5]: *** Waiting for unfinished jobs.... 
> > | if [ "-pg" = "-pg" ]; then if [ 
> > /home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4 
> > _64-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/driver/pci.o 
> > != "scripts/mod/empty.o" ] 
> > ; then ./scripts/recordmcount 
> > 
> "/home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_64-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/driver/pci.o"; 
>
> > fi; fi; 
> > | make[4]: *** 
> > 
> [/home/parth/AGL/build-agl-jailhouse-rpi/tmp/work-shared/raspberrypi4-64/kernel-source/scripts/Makefile.build:544: 
>
> > 
> /home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_64-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/driver] 
>
> > Error 2 
> > | make[3]: *** 
> > 
> [/home/parth/AGL/build-agl-jailhouse-rpi/tmp/work-shared/raspberrypi4-64/kernel-source/Makefile:1527: 
>
> > 
> _module_/home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_64-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git] 
>
> > Error 2 
> > | make[2]: *** [Makefile:146: sub-make] Error 2 
> > | make[1]: *** [Makefile:24: __sub-make] Error 2 
> > | make: *** [Makefile:40: modules] Error 2 
> > | WARNING: 
> > 
> /home/parth/AGL/build-agl-jailhouse-rpi/tmp/work/raspberrypi4_64-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/temp/run.do_compile.24833:1 
>
> > exit 1 from 'exit 1' 
> > | 
> > ERROR: Task 
> > 
> (/home/parth/meta-yocto-jailhouse-rpi4/recipes-kernel/jailhouse/jailhouse_git.bb:do_compile) 
>
> > failed with exit code '1' 
> > NOTE: Tasks Summary: Attempted 1466 tasks of which 1465 didn't need to 
> > be rerun and 1 failed. 
> > 
> > Summary: 1 task failed: 
> > 
> /home/parth/meta-yocto-jailhouse-rpi4/recipes-kernel/jailhouse/jailhouse_git.bb:do_compile 
>
> > Summary: There were 2 WARNING messages shown. 
> > Summary: There were 2 ERROR messages shown, returning a non-zero exit 
> code. 
> > 
>
> I suspect your target kernel lacks CONFIG_HOTPLUG_CPU=y. See 
> jailhouse-images for a know-to-work reference config. 
>
> Also note that you will need an ATF-based boot on the RPi4, just in case 
> you didn't spot that dependency yet. Again, jailhouse-images is the 
> reference. 
>
> Jan 
>
> -- 
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE 
> Corporate Competence Center Embedded Linux 
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/5d346985-f668-4940-8f6f-520f72cf1842o%40googlegroups.com.

------=_Part_2796_541743720.1594988154590
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">How did you figure that out?<div><br><br>On Friday, July 1=
7, 2020 at 11:37:23 AM UTC+5:30, Jan Kiszka wrote:<blockquote class=3D"gmai=
l_quote" style=3D"margin: 0px 0px 0px 0.8ex; border-left: 1px solid rgb(204=
, 204, 204); padding-left: 1ex; --darkreader-inline-border-left:#3e4648;" d=
ata-darkreader-inline-border-left=3D"">On 17.07.20 05:13, Parth Dode wrote:
<br>&gt; I am using=C2=A0 yocto to build jailhouse module in agl=C2=A0 =C2=
=A0for rpi4 .
<br>&gt; This is the error Im getting, please help figure out
<br>&gt;=20
<br>&gt; NOTE: Tasks Summary: Attempted 1466 tasks of which 1465 didn&#39;t=
 need to=20
<br>&gt; be rerun and 1 failed.
<br>&gt;=20
<br>&gt; Summary: 1 task failed:
<br>&gt; /home/parth/meta-yocto-<wbr>jailhouse-rpi4/recipes-kernel/<wbr>jai=
lhouse/jailhouse_git.bb:do_<wbr>compile
<br>&gt; Summary: There were 2 WARNING messages shown.
<br>&gt; Summary: There were 2 ERROR messages shown, returning a non-zero e=
xit code.
<br>&gt; parth@Debian-95-stretch-64-<wbr>minimal:~/meta-yocto-<wbr>jailhous=
e-rpi4$
<br>&gt; x/9.3.0/include=20
<br>&gt; -I/home/parth/AGL/build-agl-<wbr>jailhouse-rpi/tmp/work-shared/<wb=
r>raspberrypi4-64/kernel-
<br>&gt; source/arch/arm64/include -I./arch/arm64/include/<wbr>generated=20
<br>&gt; -I/home/parth/AGL/build-agl-<wbr>jailhouse
<br>&gt; -rpi/tmp/work-shared/<wbr>raspberrypi4-64/kernel-source/<wbr>inclu=
de -I./include=20
<br>&gt; -I/home/parth/AGL/build-ag
<br>&gt; l-jailhouse-rpi/tmp/work-<wbr>shared/raspberrypi4-64/kernel-<wbr>s=
ource/arch/arm64/include/uapi=20
<br>&gt; -I./arch/ar
<br>&gt; m64/include/generated/uapi=20
<br>&gt; -I/home/parth/AGL/build-agl-<wbr>jailhouse-rpi/tmp/work-shared/<wb=
r>raspberrypi4
<br>&gt; -64/kernel-source/include/uapi -I./include/generated/uapi -include=
=20
<br>&gt; /home/parth/AGL/build-agl-jail
<br>&gt; house-rpi/tmp/work-shared/<wbr>raspberrypi4-64/kernel-source/<wbr>=
include/linux/kconfig.h=20
<br>&gt; -D__KERNEL__ -mli
<br>&gt; ttle-endian -D__ASSEMBLY__ -fno-PIE -DCONFIG_AS_LSE=3D1 -mabi=3Dlp=
64=20
<br>&gt; -Wa,-gdwarf-2 -DMODULE -c -o /h
<br>&gt; ome/parth/AGL/build-agl-<wbr>jailhouse-rpi/tmp/work/<wbr>raspberry=
pi4_64-agl-linux/<wbr>jailhouse/0.12+gitAUTOIN
<br>&gt; C+4ce7658ddd-r0/git/driver/<wbr>vpci_template.dtb.o=20
<br>&gt; /home/parth/AGL/build-agl-<wbr>jailhouse-rpi/tmp/work/r
<br>&gt; aspberrypi4_64-agl-linux/<wbr>jailhouse/0.12+gitAUTOINC+<wbr>4ce76=
58ddd-r0/git/driver/vpci_<wbr>template.dtb.S
<br>&gt; | (cat /dev/null; ) &gt;=20
<br>&gt; /home/parth/AGL/build-agl-<wbr>jailhouse-rpi/tmp/work/<wbr>raspber=
rypi4_64-agl-linux/
<br>&gt; jailhouse/0.12+gitAUTOINC+<wbr>4ce7658ddd-r0/git/tools/<wbr>module=
s.order
<br>&gt; |=20
<br>&gt; /home/parth/AGL/build-agl-<wbr>jailhouse-rpi/tmp/work/<wbr>raspber=
rypi4_64-agl-linux/<wbr>jailhouse/0.12+gitAU
<br>&gt; TOINC+4ce7658ddd-r0/git/<wbr>driver/cell.c: In function=20
<br>&gt; &#39;jailhouse_cmd_cell_create&#39;:
<br>&gt; |=20
<br>&gt; /home/parth/AGL/build-agl-<wbr>jailhouse-rpi/tmp/work/<wbr>raspber=
rypi4_64-agl-linux/<wbr>jailhouse/0.12+gitAU
<br>&gt; TOINC+4ce7658ddd-r0/git/<wbr>driver/cell.c:31:26: error: implicit =
declaration=20
<br>&gt; of function &#39;cpu_down&#39; [
<br>&gt; -Werror=3Dimplicit-function-<wbr>declaration]
<br>&gt; | 31 | #define remove_cpu(cpu) cpu_down(cpu)
<br>&gt; | | ^~~~~~~~
<br>&gt; |=20
<br>&gt; /home/parth/AGL/build-agl-<wbr>jailhouse-rpi/tmp/work/<wbr>raspber=
rypi4_64-agl-linux/<wbr>jailhouse/0.12+gitAU
<br>&gt; TOINC+4ce7658ddd-r0/git/<wbr>driver/cell.c:243:10: note: in expans=
ion of=20
<br>&gt; macro &#39;remove_cpu&#39;
<br>&gt; | 243 | err =3D remove_cpu(cpu);
<br>&gt; | | ^~~~~~~~~~
<br>&gt; | if [ &quot;-pg&quot; =3D &quot;-pg&quot; ]; then if [=20
<br>&gt; /home/parth/AGL/build-agl-<wbr>jailhouse-rpi/tmp/work/<wbr>raspber=
rypi4
<br>&gt; _64-agl-linux/jailhouse/0.12+<wbr>gitAUTOINC+4ce7658ddd-r0/git/<wb=
r>driver/sysfs.o=20
<br>&gt; !=3D &quot;scripts/mod/empty.o&quot;
<br>&gt; ]; then ./scripts/recordmcount=20
<br>&gt; &quot;/home/parth/AGL/build-agl-<wbr>jailhouse-rpi/tmp/work/<wbr>r=
aspberrypi4_6
<br>&gt; 4-agl-linux/jailhouse/0.12+<wbr>gitAUTOINC+4ce7658ddd-r0/git/<wbr>=
driver/sysfs.o&quot;;=20
<br>&gt; fi; fi;
<br>&gt; | cc1: all warnings being treated as errors
<br>&gt; | make[5]: ***=20
<br>&gt; [/home/parth/AGL/build-agl-<wbr>jailhouse-rpi/tmp/work-shared/<wbr=
>raspberrypi4-64/kernel-so
<br>&gt; urce/scripts/Makefile.build:<wbr>303:=20
<br>&gt; /home/parth/AGL/build-agl-<wbr>jailhouse-rpi/tmp/work/<wbr>raspber=
rypi4_64
<br>&gt; -agl-linux/jailhouse/0.12+<wbr>gitAUTOINC+4ce7658ddd-r0/git/<wbr>d=
river/cell.o]=20
<br>&gt; Error 1
<br>&gt; | make[5]: *** Waiting for unfinished jobs....
<br>&gt; | if [ &quot;-pg&quot; =3D &quot;-pg&quot; ]; then if [=20
<br>&gt; /home/parth/AGL/build-agl-<wbr>jailhouse-rpi/tmp/work/<wbr>raspber=
rypi4
<br>&gt; _64-agl-linux/jailhouse/0.12+<wbr>gitAUTOINC+4ce7658ddd-r0/git/<wb=
r>driver/pci.o=20
<br>&gt; !=3D &quot;scripts/mod/empty.o&quot; ]
<br>&gt; ; then ./scripts/recordmcount=20
<br>&gt; &quot;/home/parth/AGL/build-agl-<wbr>jailhouse-rpi/tmp/work/<wbr>r=
aspberrypi4_64-agl-linux/<wbr>jailhouse/0.12+gitAUTOINC+<wbr>4ce7658ddd-r0/=
git/driver/pci.<wbr>o&quot;;=20
<br>&gt; fi; fi;
<br>&gt; | make[4]: ***=20
<br>&gt; [/home/parth/AGL/build-agl-<wbr>jailhouse-rpi/tmp/work-shared/<wbr=
>raspberrypi4-64/kernel-source/<wbr>scripts/Makefile.build:544:=20
<br>&gt; /home/parth/AGL/build-agl-<wbr>jailhouse-rpi/tmp/work/<wbr>raspber=
rypi4_64-agl-linux/<wbr>jailhouse/0.12+gitAUTOINC+<wbr>4ce7658ddd-r0/git/dr=
iver]=20
<br>&gt; Error 2
<br>&gt; | make[3]: ***=20
<br>&gt; [/home/parth/AGL/build-agl-<wbr>jailhouse-rpi/tmp/work-shared/<wbr=
>raspberrypi4-64/kernel-source/<wbr>Makefile:1527:=20
<br>&gt; _module_/home/parth/AGL/build-<wbr>agl-jailhouse-rpi/tmp/work/<wbr=
>raspberrypi4_64-agl-linux/<wbr>jailhouse/0.12+gitAUTOINC+<wbr>4ce7658ddd-r=
0/git]=20
<br>&gt; Error 2
<br>&gt; | make[2]: *** [Makefile:146: sub-make] Error 2
<br>&gt; | make[1]: *** [Makefile:24: __sub-make] Error 2
<br>&gt; | make: *** [Makefile:40: modules] Error 2
<br>&gt; | WARNING:=20
<br>&gt; /home/parth/AGL/build-agl-<wbr>jailhouse-rpi/tmp/work/<wbr>raspber=
rypi4_64-agl-linux/<wbr>jailhouse/0.12+gitAUTOINC+<wbr>4ce7658ddd-r0/temp/r=
un.do_<wbr>compile.24833:1=20
<br>&gt; exit 1 from &#39;exit 1&#39;
<br>&gt; |
<br>&gt; ERROR: Task=20
<br>&gt; (/home/parth/meta-yocto-<wbr>jailhouse-rpi4/recipes-kernel/<wbr>ja=
ilhouse/jailhouse_git.bb:do_<wbr>compile)=20
<br>&gt; failed with exit code &#39;1&#39;
<br>&gt; NOTE: Tasks Summary: Attempted 1466 tasks of which 1465 didn&#39;t=
 need to=20
<br>&gt; be rerun and 1 failed.
<br>&gt;=20
<br>&gt; Summary: 1 task failed:
<br>&gt; /home/parth/meta-yocto-<wbr>jailhouse-rpi4/recipes-kernel/<wbr>jai=
lhouse/jailhouse_git.bb:do_<wbr>compile
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
<br></blockquote></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/5d346985-f668-4940-8f6f-520f72cf1842o%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/5d346985-f668-4940-8f6f-520f72cf1842o%40googlegroups.co=
m</a>.<br />

------=_Part_2796_541743720.1594988154590--

------=_Part_2795_2119338829.1594988154589--
