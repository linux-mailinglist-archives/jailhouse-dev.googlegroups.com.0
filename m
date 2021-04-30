Return-Path: <jailhouse-dev+bncBAABBP7HVWCAMGQE5BV5URA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53b.google.com (mail-ed1-x53b.google.com [IPv6:2a00:1450:4864:20::53b])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDDD36F436
	for <lists+jailhouse-dev@lfdr.de>; Fri, 30 Apr 2021 05:04:32 +0200 (CEST)
Received: by mail-ed1-x53b.google.com with SMTP id s20-20020a0564025214b029038752a2d8f3sf10429683edd.2
        for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Apr 2021 20:04:32 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1619751872; cv=pass;
        d=google.com; s=arc-20160816;
        b=g62oZe/Wpec/n4gAbbqaKIJK1a0f4jqnZNQwpgChnQXWKBSftHXHSNfSbh5tfapwkS
         1qMXdu+O/T15LFBcZzRVa6PBRotbYCukpq1wKRp2YzOLZMtKoYLEh3pD8fl5ttH8wOOA
         LW2gu7MP7YJzlzteKmoMZDc71p1SK66/P3PmSMIQxNLFN+njUSgyhuDnLguqDCJ77Jf2
         8+VivhmB7+TyEhLyJzAlH4f7TsxyYm5uj/MexfSpBoEpeV8FITarTloWr/jkdaKhm5S2
         DzThB/mwaq8yb0f6GNGVng0kTdpCZ2AL4qfEpZ22irzTamH+/14tKEB6Gm7xPnc3mMCE
         JvQA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:message-id:mime-version
         :content-transfer-encoding:subject:to:from:date:sender
         :dkim-signature;
        bh=15m7zyLuzxAIsJ2KSxjeyc7ZyHjyFpimScGT3AfLlsY=;
        b=OYKi57+7+Y1u/EgBfIoXXedfXMdLgmiWYcfZTmZDBNasv2xVgdR4jV+Ysh5uFBQQKH
         DdPWNSlfKFrs2SugKP3dk+DtgiyCt4qWjqNq1m1x3Y5XfuVAO8Dy+z7tfUDkMa3ZeR32
         KBikkbFAEeHgfl8ypdFTQK9eQ5W9TGwE5O1pYEMo1OqKMP+heeD9EsZUPWdy/Shw2cMo
         8LiHPIfH+8Vm/dMCcINzbCT6iQjHJJqpyma5JMchssnXHzFbvJ4VwrVO2mhau1QlmazF
         1CiscFvS0RONY5ztED9c8XnIwdUG9E6Kq3jgTDSQ+VP4Daew3lRQ7Anl717dHt4LuLJM
         +OlQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of caohp19@lzu.edu.cn designates 165.227.154.27 as permitted sender) smtp.mailfrom=caohp19@lzu.edu.cn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:subject:content-transfer-encoding:mime-version
         :message-id:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=15m7zyLuzxAIsJ2KSxjeyc7ZyHjyFpimScGT3AfLlsY=;
        b=i1G4y5DGatl+z0IR22/17fj8qwl7C0jiraFVsGqF0UY6Jhy11z5FucO0FRZPSMtqLx
         x5bcObG/Iefa2LYVRB/mHa+HOmNgt/me1B64+OHSq10kHMKGtyS6CbO6pWl9x73MhRms
         X4ypD+V6TsURkySUZTTvcxvTVQqWLi7k24JMUf+U9DPeyJdvJb/zLKGmd+R0mAaD+ltx
         onL1rw+/SZBZfJH2AqB2lMxAPP4S3ZqRrg/CQKqL20mMoUT+lT15M4nxCRKx1GBoxYb6
         KB3rmc4jwYCKDqeE5MXo4U5bhy2eO5HYU8OdcINf3zW9yAZcDB8vqJkCya/bzCWGU8oY
         Ab/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:subject
         :content-transfer-encoding:mime-version:message-id:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=15m7zyLuzxAIsJ2KSxjeyc7ZyHjyFpimScGT3AfLlsY=;
        b=hlZU2AdG1B58hH4bYUYejXGUb0yUOLbMljrWZhBB9XuFoYpX90m/XGKpQE1eVtUEj4
         1rKj9XcgmsMCFmietaDleJzD7i3XHOW4BhodDEw6pPwAH9n0foOlX64w+6m95zjf6uwK
         EloyN2KWiQt7r7/R+v+jHiOkn8CGphRWipsyLhTXgFSB4192Sp1BsAlUN5MMWTEZeTrc
         7pblmBlLk+wRdF0mG2xAg1+928RDyTC3jOQXXPzuaX6OVdGEN25+OLsomGmvKbrGkI68
         DUdOv72hsUyAe81mhkrFjB68VK/Xx/RMY+eSjYio4T65NNHopnw+u3yxcwJ1GNWJ2y1X
         Xhtg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531rcstTzAndV8vog1KFbvDLlS/IQb63EIFmLD35fBuvD5QNbHhk
	0ut97yqmwBlpdl4J2FiuGDk=
X-Google-Smtp-Source: ABdhPJxbbwKOpZEB45Oa+2FFlNT0zm3cRAkg5iT3HA7W628vyufg7Heu6q7+WMT6ajazno3Vrfm3dw==
X-Received: by 2002:aa7:c7da:: with SMTP id o26mr3139768eds.244.1619751872401;
        Thu, 29 Apr 2021 20:04:32 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:fa90:: with SMTP id w16ls3008706edr.1.gmail; Thu, 29 Apr
 2021 20:04:31 -0700 (PDT)
X-Received: by 2002:a50:fc91:: with SMTP id f17mr3104164edq.23.1619751871364;
        Thu, 29 Apr 2021 20:04:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619751871; cv=none;
        d=google.com; s=arc-20160816;
        b=oelbSSJZWELPXfaXd8WRyQdeVxgfZpP4ARl1rFXWCnCVo1mQ7rAWq4KcvXAO7tihL3
         MvULTrBEOXlD7pi2kCzumLNrFlYA7ek3R29BTux5T811kXCJ1NwPkHxr+TyG7HNeRf1B
         q6qS5tHvkF9ihf5KIkIvsfwmljpYub64V0F52ahrn93DL10VweCEY21KFIc6FH25n9JB
         +e8VZc5pltVqrVuIYPnbGgwQ2yawqmn5UqvTP+1HXwTRLdac3/0JGnZl0bXR1BJqDO2j
         5CJFjz8ZRvSP/60WWcLuXM5Yxv5EfGoYpRhYB6lhB8UyGFimmrsHeVxCQDvlgqEboDqI
         cZsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:mime-version:content-transfer-encoding:subject:to:from
         :date;
        bh=H4PPNzBOYW4ZenUda0uOfo+EfrFh6oEUtSXDlhh6/qI=;
        b=K6Sh2Rvsx9gVn8ELusf7AAwTlgvZLffWYQPdVBVfo4F8/veyeZ3HguLQL9I3IJCnBW
         TS8E//KXpiViuj8d2EU14p4L9U97BcSY8rEhENimrYyluIWH1uqn8rMdSvqccEqpIF4I
         xx9TpuoyRTUZIn0s/bYgqXMC1CnCDpmcz7S7Z1QnJRX0rWOZ3Utqap6xmkSuXAi4eHeM
         uYTSDhcoNsiDL42sDkNXTYrJupsZ4/wPCnewY8UMo5wyN/vqWeRnj+iaNBDixANkQmY/
         fW189AcupXi25SDYDkTDEJhDHJBSWIHYJ2eQhnD463jQtFAHNQMCLPiX50/aq5BXFrRm
         q9/A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of caohp19@lzu.edu.cn designates 165.227.154.27 as permitted sender) smtp.mailfrom=caohp19@lzu.edu.cn
Received: from zg8tmty1ljiyny4xntqumjca.icoremail.net (zg8tmty1ljiyny4xntqumjca.icoremail.net. [165.227.154.27])
        by gmr-mx.google.com with SMTP id c11si320840edy.4.2021.04.29.20.04.30
        for <jailhouse-dev@googlegroups.com>;
        Thu, 29 Apr 2021 20:04:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of caohp19@lzu.edu.cn designates 165.227.154.27 as permitted sender) client-ip=165.227.154.27;
Received: by ajax-webmail-app1 (Coremail) ; Fri, 30 Apr 2021 11:04:27 +0800
 (GMT+08:00)
X-Originating-IP: [210.26.59.142]
Date: Fri, 30 Apr 2021 11:04:27 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5pu55a6P6bmP?= <caohp19@lzu.edu.cn>
To: jailhouse-dev@googlegroups.com
Subject: HELP about Jailhouse
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.12 build 20200616(0f5d8152)
 Copyright (c) 2002-2021 www.mailtech.cn lzu.edu.cn
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Message-ID: <3f44dbbd.3c81.17920bc1642.Coremail.caohp19@lzu.edu.cn>
X-Coremail-Locale: en_US
X-CM-TRANSID: ygmowADHU_m8c4tgkekQAA--.5427W
X-CM-SenderInfo: hfdrx1arz6z6vxohv3gofq/1tbiAQsHBl2vOvUlHgAAsN
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-Original-Sender: caohp19@lzu.edu.cn
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of caohp19@lzu.edu.cn designates 165.227.154.27 as
 permitted sender) smtp.mailfrom=caohp19@lzu.edu.cn
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

Dear sir,
&gt; Dear sir,
&gt; Last year, I used the rapi-linux-demo.cell to launch a second cell on =
my Raspberry Pi 4 model B. And the memory size of second cell was about 184=
M.
&gt; However, that is not enough to me to execute some test on it. So I try=
 to change the size of the cell in the rpi-linux-demo.c, but it failed (may=
be occupied
&gt;  other's memory, I don't know). A good news is, someone fixed this pro=
blem. The demo can provide 1G memory size=EF=BC=8C and I git clone the new =
project.
&gt;
&gt; BUT when I executed the operations same with before, I can not build t=
he jailhouse
&gt;
&gt; my operations is:
&gt; 1. git clone https://github.com/siemens/jailhouse.git
&gt; 2. sudo make &amp;&amp; make modules_install &amp;&amp; make install
&gt; 3. sudo insmod driver/jailhouse.ko
&gt; 4. sudo jailhouse enable configs/arm64/rpi4.cell
&gt;
&gt; The 4th step is failed, the error is:
&gt; JAILHOUSE_ENABLE: Invalid argument
&gt;
&gt; I don't know why it occurs. Because there are two project on my Raspbe=
rry (one is new, the other is cloned in last year ), the old one can run pr=
operly.
&gt; If I can get your generous help, I will appreciate.
&gt;

First of all, thanks for Jan give me advice. I accept his advice and obtain=
 some information.
(NOTE: I just used the new project and I never changed the configs/arm64/rp=
i4.c)
when I execute=20
jailhouse enable rpi4.c
the error is=20
 JAILHOUSE_ENABLE: Invalid argument
and then I see some information from the putty
jailhouse:request_mem_region failed for hypervisor memory=20
I don't know whether this error caused or not. Because I can run successful=
ly using old project and it also warn this problem. And I execute the follo=
wed command
sudo jailhouse config check configs/arm64/rpi4.cell=20
the message is:

Reading configuration set:
  Root cell:     Raspberry-Pi4 (configs/arm64/rpi4.cell)
Overlapping memory regions inside cell: None
Overlapping memory regions with hypervisor: None
Missing PCI MMCONFIG interceptions: None
Missing resource interceptions for architecture arm64: None

So what should I do ? If I can get your generous help , I will appreciate.

Yours,
Hongpeng Cao.=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/3f44dbbd.3c81.17920bc1642.Coremail.caohp19%40lzu.edu.cn.
