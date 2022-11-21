Return-Path: <jailhouse-dev+bncBAABBTP256NQMGQEM7WA47Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id D81DC632FE8
	for <lists+jailhouse-dev@lfdr.de>; Mon, 21 Nov 2022 23:35:58 +0100 (CET)
Received: by mail-lf1-x138.google.com with SMTP id y26-20020a0565123f1a00b004b4b8aabd0csf4456691lfa.16
        for <lists+jailhouse-dev@lfdr.de>; Mon, 21 Nov 2022 14:35:58 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1669070158; cv=pass;
        d=google.com; s=arc-20160816;
        b=vZp1bowhy4tY4SobMYLp7Bc86wAX/Vpt0NhLBs+1t3f/h4icvfYO9aIjuYSAIi9UKg
         BI6b6G4SwK32iUnbxL6sy9b5+kR5MYwaphB6FwSMV2hgIwivt5lzwHoLmIbPyqS0rJUP
         QI39qrlhsbtVeuNnCPyHNACI80yS25TSd2Fl5DhbOdpE1Kd/eRJO532ivQcroXbYJBfY
         j3kAFOlD8YZJuc+p/tFNVlcpAYhhIEPHnOnRyDkg7+OgySxwFgUAR4WlzRpHG5trHb1I
         U7QErP9salPHwW9ylFibcSRMqwYjKgoBpVOBQhQOxgAC8xCg3lgLh2lEBFb/qTFllN8m
         wSRA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding:subject
         :from:content-language:to:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=JtWS1GUwXYZcjGWtYVlBgtbfiSwARHKyfDzTOImOWh8=;
        b=gm34e4bK/lWZ/KmyKytMR49bD+ySbiFgbM3ttgqu6JlJVegCpSFcfJjA6t28it9nYA
         nkLMafGFP5EzWFb1rtdupywLrBRdKtPoKNUZpo3sKxQSRF16+JsSgBly5q+Xzm0PqiWO
         UetBsydbw/DgBwQ9X94YuXHUjwkarzpRUFfknMreg8y+sb7Bhelaiek8JasuqGXuN6Bt
         58SjAk97Ws9MVg6oC2bumi+zH65IDTOkTVCaImU3TH7yRu7qfT7uySIFWu6s3YKII8xR
         zAXMsnrflQ2VSsVwj2l/Ly5GcrblHNNIyUzeR1/e+dwVaSbKH5GyC7d7hV2E7jkavRVT
         apIg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of marco.barletta@unina.it designates 192.132.34.7 as permitted sender) smtp.mailfrom=marco.barletta@unina.it
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:subject:from
         :content-language:to:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JtWS1GUwXYZcjGWtYVlBgtbfiSwARHKyfDzTOImOWh8=;
        b=mbsuBjYRWOTwjghxp0AkO/3Q8ikZ2OF/AyUufzelK+y2XRdzF4fvnMKPed3iXhWLVb
         9mTtlIZR+UL5YiLY+Sqgl0tAhFMLNYQmz97FYpfalTmn6LgQVklDz2QwnqdFyCIWrJZs
         ac1iJ04smeDZJ0Sps2FSWiykSgq9+4VRyLsnHamJMgr08Ptavc43PX76JoWlkGzVduDF
         3BeXm1u2nXaqsEOyrQwLosDZZPEuzqY0GODSqO+wGtitn2ypqKDy8Vqn5KBDb+k8TYEs
         EnCR5asiW5e+HFPbzj0wDwPPhkW37+2U2ZVyaHs1bBZME8j8Soxm53hiP9Q9DF9UprHZ
         nSpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JtWS1GUwXYZcjGWtYVlBgtbfiSwARHKyfDzTOImOWh8=;
        b=P2yz/0hUC9KLj8MRLyFqZohmSXXdxI+0ijzukQhpJlYc87npJjYGhxS6oC6hD4Dk5b
         HhxJDRFcmClEi7DSn13fdl9VnGGLWFQshMj8uQUsKUCDOcicbKo6IGhgPRvCMCazkt23
         6BcTvqrSf0/v7X1HXLwTolLyVjXe16OohNJ+I9oQrnWo+rezRkdmjI9TX6r0BY3oGhXn
         UCn3HrtDwnRZ5nMeZSSXrLpOgyiAgDs+Tv2IA6LkLaRrUP1yFi4J+PWzeV7desLKrEFS
         F1WXYoGh09Xd3e+3ruOIerD7d5AN9eMZyjiZyMW2HVDqEI5RGi8DUF51XLCsMCitzfCw
         CLIQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANoB5pk+xFyYxfKlt+pb7IBhkVcwRQJ8YO9QumoqOWABWuicgfwuFoG7
	E6YT8wGKgT+NqZIGVEWjqXU=
X-Google-Smtp-Source: AA0mqf43mIB9B5o5USBpKpo9ef/bexk49UHGqiucsLDYtqZInVionh+F5bU3BrYYIzx2XgHy+BsNrg==
X-Received: by 2002:a05:6512:3c9c:b0:4a2:2f2f:449b with SMTP id h28-20020a0565123c9c00b004a22f2f449bmr589206lfv.235.1669070158168;
        Mon, 21 Nov 2022 14:35:58 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3147:b0:48b:2227:7787 with SMTP id
 s7-20020a056512314700b0048b22277787ls1031842lfi.3.-pod-prod-gmail; Mon, 21
 Nov 2022 14:35:56 -0800 (PST)
X-Received: by 2002:ac2:430e:0:b0:4b4:9c0b:f4d3 with SMTP id l14-20020ac2430e000000b004b49c0bf4d3mr6594376lfh.349.1669070156511;
        Mon, 21 Nov 2022 14:35:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669070156; cv=none;
        d=google.com; s=arc-20160816;
        b=XkloM4D88vXG/9eVPTnWQIARJBgktYOhH5qXxoWi0ulFQkIav6luFKZxv7bwuEFjvS
         V+Sj2S7zRC4gITVisnrb9R1Eb/gW01WnxzkmDKjD+b8RQEWo/ezrBqnddtz2sMvotHwn
         xSgYlVXaL8FC+LCzQiTJP8J3x8jPI93s8t3DH1Z5nsXqaodrBJNnGJJ61QPjw1x/avg5
         DuC5C6kxmk1xBVAI1uirGsz1g2sereSdlIOJUojo6T1Cmhof/cwiJd2NgVARLn6A317t
         pKu5PDJB1Q9303i/nzS6emsHNnbOfp4LZaH3YHEH0QWHc+kk/Xir1vmUFo4CSqTZ5jVO
         Kuow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id;
        bh=gBGB3D+qqpQGPTnLCXV1miOJ9kGkQtyZyw/huqZ3zuw=;
        b=NjK9bahVFUeRAtTMa4BqzlANYOidqVIGQ8G7Qc/SDLoyN7zdbZIm02p5a0nGmR4wIb
         eiJdtj6O0nhVPdwkVWk5eASTsNTHMSJ1txC+wWJaEyc8cidV/zAl866NGsGkhV+zjq7F
         KbXUnSeJ6PQB0b0f2ifPX6KLIHFVMaZE8SVe8di9WYmP7AoNXyFS7r0wacsBXCsj8PEx
         3VRZAe862kdq8rCAga6uTcSeckxXCfbMAb/l/W42VVuThn+U34nd5eLv5d0ZeSOSWBrc
         y1IEcOeYJNytydTQzWZVoJaKo8i5XgQYLeJ5K/uzzpmYkRffYwAG/CdQe155DxZErmyc
         P/DA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of marco.barletta@unina.it designates 192.132.34.7 as permitted sender) smtp.mailfrom=marco.barletta@unina.it
Received: from leas1.unina.it (fmvip.unina.it. [192.132.34.7])
        by gmr-mx.google.com with ESMTPS id k8-20020a2ea268000000b0027737e93a12si532300ljm.0.2022.11.21.14.35.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 14:35:56 -0800 (PST)
Received-SPF: pass (google.com: domain of marco.barletta@unina.it designates 192.132.34.7 as permitted sender) client-ip=192.132.34.7;
Received: from smtp2.unina.it (smtp2.unina.it [192.132.34.62])
	by leas1.unina.it  with ESMTP id 2ALMZtVf017639-2ALMZtVh017639
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=CAFAIL)
	for <jailhouse-dev@googlegroups.com>; Mon, 21 Nov 2022 23:35:55 +0100
Received: from [192.168.1.83] (host-87-11-139-35.retail.telecomitalia.it [87.11.139.35])
	(authenticated bits=0)
	by smtp2.unina.it (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTPSA id 2ALMa8lD489017
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <jailhouse-dev@googlegroups.com>; Mon, 21 Nov 2022 23:36:09 +0100
Message-ID: <48fefc80-2ba7-a1b0-e4ff-2d3d5113db80@unina.it>
Date: Mon, 21 Nov 2022 23:35:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
To: jailhouse-dev@googlegroups.com
Content-Language: en-US
From: Marco Barletta <marco.barletta@unina.it>
Subject: Request to Fix JH images for QEMU
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: clamav-milter 0.103.6 at smtp2.unina.it
X-Virus-Status: Clean
X-Original-Sender: marco.barletta@unina.it
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of marco.barletta@unina.it designates 192.132.34.7 as
 permitted sender) smtp.mailfrom=marco.barletta@unina.it
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

Dear all;
I tried to use the repo Jailhouse of demo images for building a QEMU=20
target (x86), as I did a few months ago. But something has broken. First=20
of all the SRC_URI in jailhouse.inc is a git:// URI, deprecated by=20
github (afaik). I replaced the URI with https and fixed it.
However the build fails with the following log erorr (with the flag last=20
version of jailhouse either enabled or not):

ERROR: mc:qemu-amd64-jailhouse-demo:jailhouse-jailhouse-0.9999-next-r0=20
do_prepare_build: Execution of=20
'/build/tmp/work/jailhouse-demo-amd64/jailhouse-jailhouse/0.9999-next-r0/te=
mp/run.do_prepare_build.72'=20
failed with exit code 1:
cp: cannot create regular file=20
'/build/tmp/work/jailhouse-demo-amd64/jailhouse-jailhouse/0.9999-next-r0/gi=
t/configs/x86/':=20
No such file or directory
WARNING: exit code 1 from a shell command.

ERROR: Logfile of failure stored in:=20
/build/tmp/work/jailhouse-demo-amd64/jailhouse-jailhouse/0.9999-next-r0/tem=
p/log.do_prepare_build.72
Log data follows:
| DEBUG: Executing shell function do_prepare_build
| cp: cannot create regular file=20
'/build/tmp/work/jailhouse-demo-amd64/jailhouse-jailhouse/0.9999-next-r0/gi=
t/configs/x86/':=20
No such file or directory
| WARNING: exit code 1 from a shell command.
| ERROR: Execution of=20
'/build/tmp/work/jailhouse-demo-amd64/jailhouse-jailhouse/0.9999-next-r0/te=
mp/run.do_prepare_build.72'=20
failed with exit code 1:
| cp: cannot create regular file=20
'/build/tmp/work/jailhouse-demo-amd64/jailhouse-jailhouse/0.9999-next-r0/gi=
t/configs/x86/':=20
No such file or directory
| WARNING: exit code 1 from a shell command.
|
ERROR: Task=20
(mc:qemu-amd64-jailhouse-demo:/repo/recipes-jailhouse/jailhouse/jailhouse_l=
atest.bb:do_prepare_build)=20
failed with exit code '1'

I am running kas-container on a manjaro system,=C2=A0 kernel v5.10.151,=20
x86-64 arch. The ARM64 image is broken as well.

Do you have any clue on how to fix this? We have plenty of students=20
relying on the repo for projects at our course, it would be great having=20
a quickstart for JH.

Thank you for the help, all good things;

Marco

--=20
Marco Barletta, PhD student at Universit=C3=A0 degli studi di Napoli Federi=
co II, Naples, Italy.
Member of DESSERTlab, Department of Information Technology and Electrical E=
ngineering, Via Claudio 21, Naples
Homepage: http://wpage.unina.it/marco.barletta/

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/48fefc80-2ba7-a1b0-e4ff-2d3d5113db80%40unina.it.
