Return-Path: <jailhouse-dev+bncBDM2HMO5Q4HBB44UXGUQMGQE7KDPHSI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oa1-x3a.google.com (mail-oa1-x3a.google.com [IPv6:2001:4860:4864:20::3a])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C217CBE0C
	for <lists+jailhouse-dev@lfdr.de>; Tue, 17 Oct 2023 10:48:53 +0200 (CEST)
Received: by mail-oa1-x3a.google.com with SMTP id 586e51a60fabf-1e9c1e06ce9sf6237537fac.2
        for <lists+jailhouse-dev@lfdr.de>; Tue, 17 Oct 2023 01:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1697532532; x=1698137332; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2xFYV1xtEKrlHotzSmJ/dchuGJNBYyAAkjpLl1O+BjE=;
        b=mFS1GDKkhqvuZ50EBkptw2Nzhcgq53FDQRoAG78o5JJiUv+KxMd/b1PN/UmCGRpsXZ
         qm9lEHr25/esR4drcWnM5UihszpOTTKjU7jKECTwp3q46Wr4vO74xxVoDiN8ycOYMcNy
         7shaLMopbl06kpYFDGMDj1s6egTC7Z+J+3bmjFEX/LQvjqYEHrOC0TGMUlxnq0s4uJez
         VxzW+q+DPon6gc0a7UUq7vDTskwcsjZ7kZqYLwa65hE8Yu5n+loHZBzlPAE3M5xwS0Fc
         H2LkiF16AaswlT5DE6TGMXCoUKAxU/3XYPP3Mm+Zw1Zl/AbiNewJpoHD4mXIcqBiA7Xx
         603g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marples.net; s=mail; t=1697532532; x=1698137332; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2xFYV1xtEKrlHotzSmJ/dchuGJNBYyAAkjpLl1O+BjE=;
        b=MYl1FNvqoGuWWX7I7BldQQ33xteLLV7QpoNbbKE3y0BHDo6Bh3LcrhPCOTIB0I12dZ
         /S9Ij48MY3YzrlpOQzkSXq3A7jaDooY4FhFXp0VKPFzoEmimu/po3s1FSJ83coXq8KtL
         eeErHAy/FpueKRDfSgyfxJ6IJoPM3i0iJvBKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697532532; x=1698137332;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2xFYV1xtEKrlHotzSmJ/dchuGJNBYyAAkjpLl1O+BjE=;
        b=vwATrZdO6lWj4KnYF4+J/F2UWudSZZOqGgXVfVX6ifJSojxjR9NULV9DQQQiNN9e8m
         o/YQHM/dfqSnxRuWiIK+FBWhoXByceur6LMp4dlVLtUeQmnApcmwy7NQa7iBYLbfFrlc
         rwygWdekLi7atAKOTSsPFOqD88sMQpVHzaJcWyRFFC6zyBNxkic/AYw/mcFhFnvZHgb2
         UhIfW+yY41VPULkjTBFtVbEKHqmc2IGcV++Fws2IDD4ajN0j7HRuWY/KJYpxC54u42+Z
         XWPx7Brr4kwCKjLlg7EcTSIlYfAi5jW9uDtWsC1lSdQ2FIMtbh+57/F1+oWH34t3tT8l
         zMRg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YzN231lNwtheqZzlR3GTWy+ZwgMQiGKSljxZpSMZ6shc6SMbb51
	aQ7p3e9HLjasMVmn0S6wgAs=
X-Google-Smtp-Source: AGHT+IGO5DT84JdiXT70uwzv5k0FjX4cqbFgKRvGYlwXb2MtVLasD+nKbzHGglnxmC8j8u2Tq517KQ==
X-Received: by 2002:a05:6870:780d:b0:1be:c586:31ae with SMTP id hb13-20020a056870780d00b001bec58631aemr1621808oab.40.1697532532212;
        Tue, 17 Oct 2023 01:48:52 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6871:2510:b0:1e1:5989:cb9f with SMTP id
 yx16-20020a056871251000b001e15989cb9fls1753833oab.2.-pod-prod-04-us; Tue, 17
 Oct 2023 01:48:51 -0700 (PDT)
X-Received: by 2002:a05:6871:5c7:b0:1dd:3076:9dfd with SMTP id v7-20020a05687105c700b001dd30769dfdmr615997oan.8.1697532531240;
        Tue, 17 Oct 2023 01:48:51 -0700 (PDT)
Date: Tue, 17 Oct 2023 01:48:50 -0700 (PDT)
From: Dave Marples <dave@marples.net>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <5a564454-0a20-4c44-93c2-67e30025c8a6n@googlegroups.com>
Subject: Can't install jailhouse on linux-6.1 arm system
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_3350_168231537.1697532530427"
X-Original-Sender: dave@marples.net
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

------=_Part_3350_168231537.1697532530427
Content-Type: multipart/alternative; 
	boundary="----=_Part_3351_575154880.1697532530427"

------=_Part_3351_575154880.1697532530427
Content-Type: text/plain; charset="UTF-8"

Sorry to trouble folks, but I'm having problems which are probably sticky 
fingers on my part, and it's quite possible someone can easily point me in 
the right direction.  

I'm building jailhouse on a arm64 linux 6.1 Debian bookworm system (imx8m, 
if it matters) using gcc 12.2.0...or, more specfically, failing to build. I 
get to the module install stage and then get;


ERROR: modpost: "__hyp_stub_vectors" [/root/jailhouse/driver/jailhouse.ko] 
undefined!
ERROR: modpost: "ioremap_page_range" [/root/jailhouse/driver/jailhouse.ko] 
undefined!
ERROR: modpost: "__get_vm_area_caller" 
[/root/jailhouse/driver/jailhouse.ko] undefined!
make[2]: *** [scripts/Makefile.modpost:126: /root/jailhouse/Module.symvers] 
Error 1
make[1]: *** [Makefile:1989: modpost] Error 2
make: *** [Makefile:40: modules] Error 2


So far as I can tell I have all of the required KALLSYMS set, so wondered 
if anyone else had trouble with recent kernels or if I'm missing some magic 
somewhere?

Thanks for any help.

DAVE
 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/5a564454-0a20-4c44-93c2-67e30025c8a6n%40googlegroups.com.

------=_Part_3351_575154880.1697532530427
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry to trouble folks, but I'm having problems which are probably sticky f=
ingers on my part, and it's quite possible someone can easily point me in t=
he right direction.=C2=A0=C2=A0<div><br /></div><div>I'm building jailhouse=
 on a arm64 linux 6.1 Debian bookworm system (imx8m, if it matters) using g=
cc 12.2.0...or, more specfically, failing to build. I get to the module ins=
tall stage and then get;</div><div><br /></div><div><font face=3D"Courier N=
ew"><br /></font></div><div><font face=3D"Courier New">ERROR: modpost: "__h=
yp_stub_vectors" [/root/jailhouse/driver/jailhouse.ko] undefined!<br />ERRO=
R: modpost: "ioremap_page_range" [/root/jailhouse/driver/jailhouse.ko] unde=
fined!<br />ERROR: modpost: "__get_vm_area_caller" [/root/jailhouse/driver/=
jailhouse.ko] undefined!<br />make[2]: *** [scripts/Makefile.modpost:126: /=
root/jailhouse/Module.symvers] Error 1<br />make[1]: *** [Makefile:1989: mo=
dpost] Error 2<br />make: *** [Makefile:40: modules] Error 2</font><br /></=
div><div><br /></div><div><br /></div><div>So far as I can tell I have all =
of the required KALLSYMS set, so wondered if anyone else had trouble with r=
ecent kernels or if I'm missing some magic somewhere?</div><div><br /></div=
><div>Thanks for any help.</div><div><br /></div><div>DAVE</div><div>=C2=A0=
</div><div><br /></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/5a564454-0a20-4c44-93c2-67e30025c8a6n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/5a564454-0a20-4c44-93c2-67e30025c8a6n%40googlegroups.co=
m</a>.<br />

------=_Part_3351_575154880.1697532530427--

------=_Part_3350_168231537.1697532530427--
