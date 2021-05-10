Return-Path: <jailhouse-dev+bncBAABB3XI4SCAMGQETCC4XSY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13a.google.com (mail-lf1-x13a.google.com [IPv6:2a00:1450:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id 7683A378CBB
	for <lists+jailhouse-dev@lfdr.de>; Mon, 10 May 2021 15:26:07 +0200 (CEST)
Received: by mail-lf1-x13a.google.com with SMTP id v23-20020a05651203b7b02901abd47176ffsf3401213lfp.9
        for <lists+jailhouse-dev@lfdr.de>; Mon, 10 May 2021 06:26:07 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1620653167; cv=pass;
        d=google.com; s=arc-20160816;
        b=sZambpsDvBrU2jeNDg9Y5w/Dgseb/YGGqyrmbV4uHYpX7SdP7jMfp3xwjZGgA+MZtn
         RIpzP+KBtWSg8ITSmCer6guIL7SkRXGgCglKLFOKy9vFvZrcu3e7elB+b41sX/yHDoIU
         KnSZYCwtamtnvqKm0btwrRz7g6rON+RYYpA2Im71IqsmkuOi9YoDnRjmzGdYTqwLH2p/
         inUsMlWCCP6sQzDvKp/gTdn9QDrsLSJbrVtDGiGsy5FI1wZx4w2gHPUfNmW2HYqCoLY6
         L2ypm1/KKRYs+hl2L9OGxrenJcDoletgXgTyr9BmVlpQhktm79LxMhYJlWolyiuOtL10
         159w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:message-id:mime-version
         :content-transfer-encoding:subject:to:from:date:sender
         :dkim-signature;
        bh=//zXTI1NF5qjYMLEDZLY8aymI9Ros73jJmp1Fxp5Kuw=;
        b=G1qAcqOkrY7g/QnCLyymhlmkWxfFpwxFr5Yj7PQ4GIX2gUBxvc+P1jBr0ri3EQpD50
         i3fDWdFKRaXfK79DL0QdN0uwqUKox8M62mVTVB5ZHbyR+K9nMggENm6UCi3/Zd6x9K7a
         T2OJG1Y6Q4u6GoB+fRcsUTMdH3xm+6V2+HL9zX46y18mhSPhtgnp7ugUi3HU7/AG5XH6
         7qYyxRD5v5tlBU39J8OPgGPXshmrE78gGvPgLGhta0zLoMI+KTHRbli+ArEnZK4s237P
         EaJs2DT5yvlnlTSGWTljLJxAb43CliF2FZcMWRiPGjrP43ouaOpd7YP898VOL4ZZzNyw
         nR8Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of caohp19@lzu.edu.cn designates 165.227.154.27 as permitted sender) smtp.mailfrom=caohp19@lzu.edu.cn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:subject:content-transfer-encoding:mime-version
         :message-id:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=//zXTI1NF5qjYMLEDZLY8aymI9Ros73jJmp1Fxp5Kuw=;
        b=Xo+zpmoTs/al6EpwgHbXCUXMd5WMAjIgwAkaY9b5xq9z6HCKUFD+3YhVd/M9aHYW8y
         3Va3D8ASIqb3sC13Tjz0vmPadnMzCciFBxUJJiUOcyWnSATuZbS+4G0F3pi3sWtZ9FpE
         XvioJ6fgEJ8j8dNJYIhzbGJWxmLdenuJ7NEyznLRKkO9OqsMzl9Q3PRgSgzD+FKakwfA
         0tZt6TuWpp6bzGVGRjNhAmFFb4zLUkw+ChRxZbNVKbIPTvkMKhDYAQsxrSJHMGhUFxlP
         05SsKkDDlUJBZCuQ7A4FUJYKmy+KlRO2XpILxGcT2NAOFNECvxKn44uhQMAFYv+JzM1L
         511g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:subject
         :content-transfer-encoding:mime-version:message-id:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=//zXTI1NF5qjYMLEDZLY8aymI9Ros73jJmp1Fxp5Kuw=;
        b=q7kV9fKi5sCB+PezODmsW/pM+NV6fMvuCZDRGXvHZOVdWOZ8TJORgv+Or80lATW0hC
         z2AceMI1AGEQ/G6J1XR6eOBNZjiUTDbD6/DraL/xOZRUbkJl0XNF5/cHXy47Y2Z25lom
         Iwfo4TYZf+pzaLrdduMCCZboeS3lu75v68Hf4YFkqRiMmD9StxsbyWGD8HWwZqvi8/UE
         VAeKTmXgeWV6KEQ0svLPmEEcV8idrmDK89fKA02ixnVcYkBt2/VnpKkr5TeHxk7/8SDa
         7nm0+d1RUcofzkEfvpRxQLMkw1uDTCxv+5prs6iT/GFuPZhTJYU+Ea8bF+tBgZc0QYuT
         Cd0w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531GVn53+zWpry/3/2y1g+ErbOqAG3HGFg/OV1y9C3UEGgNzdMsM
	tqO4hpZj0akBouy5n+yPcQs=
X-Google-Smtp-Source: ABdhPJzE8IOEoBOwmgI1CB4QbaL+I0CflqSGHEjXDcOJ6CHfQ5jWKvhbFBmV7VOz87innjjEykYLgw==
X-Received: by 2002:a05:6512:3d94:: with SMTP id k20mr16497678lfv.604.1620653167004;
        Mon, 10 May 2021 06:26:07 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9806:: with SMTP id a6ls479831ljj.10.gmail; Mon, 10 May
 2021 06:26:05 -0700 (PDT)
X-Received: by 2002:a2e:8057:: with SMTP id p23mr11526843ljg.91.1620653165863;
        Mon, 10 May 2021 06:26:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620653165; cv=none;
        d=google.com; s=arc-20160816;
        b=UpRV8UHWQ8co/rNV5HNa50ByfhPT58CsUlfGWVekYRrHwU0rr9ki0UeWZQueIl3+ak
         qItR+AR/DhC3+s9T9xSiwh6m5n+KT1v+105xKSYNe/5GxLnBpQ+h2ZRycIn+44K1O7e0
         WytkuBLZh6rEPPam/R/hDxWg1Ru8TJ4SpXryQxNAvUDnZ8rs6tYR7un8YPkiyWEv6Skx
         jVfu3CwnvGXbPaN9tjgNZWGRkbl18KW1X7xCKK5gxWZA+y/89DDwlI4aDsIx/tLWTF1y
         l5JSDAFvdpTbmo/8/4pKOQFEyazvuXgXE+mJbDQpZOFtC3G+YaEwKMbQgsnXsWI1rde6
         KrZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:mime-version:content-transfer-encoding:subject:to:from
         :date;
        bh=28+vUIUHQKdQ65lSTiPM0kUUTN7yM8M5ts75zCxZkxg=;
        b=Op5e3Ic7WIKI5uZOIo5/x3EGJA1C0o5ZlAeQ8Z0VsMuPlEGuJa0SJeQq8Kd9bBTpj1
         17CXHV9Cmr+7nk6Q4v57GVIvGmWJs/ZaUN+T20vTGWoH8Rohgjm8wdst71b+Udglk030
         hNhG2N3WHpDdAF0kFAZCiuUFzdQiOGQ0YWbm6gXx/C2WJdtUhU3sslnM9haoFtGFMtu4
         tCZ7KMFHvPkMEq6nxL3mAujzD7J79c48AP9UFy9f84aqBWei/IGTSlQ1AfyVO8HTJnkh
         X+QBEZS81F3jOg0gfoDZKoalYMUztvowZkHFUOwcyMq4iR/ZhWkcmsTA9PNUViqfzsY8
         4oTw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of caohp19@lzu.edu.cn designates 165.227.154.27 as permitted sender) smtp.mailfrom=caohp19@lzu.edu.cn
Received: from zg8tmty1ljiyny4xntqumjca.icoremail.net (zg8tmty1ljiyny4xntqumjca.icoremail.net. [165.227.154.27])
        by gmr-mx.google.com with SMTP id 17si577096lfp.2.2021.05.10.06.26.05
        for <jailhouse-dev@googlegroups.com>;
        Mon, 10 May 2021 06:26:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of caohp19@lzu.edu.cn designates 165.227.154.27 as permitted sender) client-ip=165.227.154.27;
Received: by ajax-webmail-app1 (Coremail) ; Mon, 10 May 2021 21:26:02 +0800
 (GMT+08:00)
X-Originating-IP: [210.26.59.142]
Date: Mon, 10 May 2021 21:26:02 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5pu55a6P6bmP?= <caohp19@lzu.edu.cn>
To: jailhouse-dev@googlegroups.com
Subject: HELP about Jailhouse image
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.12 build 20200616(0f5d8152)
 Copyright (c) 2002-2021 www.mailtech.cn lzu.edu.cn
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Message-ID: <71b9b404.86dc.1795674be56.Coremail.caohp19@lzu.edu.cn>
X-Coremail-Locale: en_US
X-CM-TRANSID: ygmowACXI_lrNJlgGIopAA--.11157W
X-CM-SenderInfo: hfdrx1arz6z6vxohv3gofq/1tbiAQwRBl2vOvZLbQACsA
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

Dear sir:

I use the jailhouse-image and choose the 11th option Raspberry Pi 4 (1-8 GB=
 editions).
git clone https://github.com/siemens/jailhouse-images.git
However there are some error information :

ERROR: mc:rpi4-jailhouse-demo:linux-jailhouse-rpi-5.4.59-r0 do_fetch: Fetch=
er failure: Fetch command export PSEUDO_DISABLED=3D1; unset _PYTHON_SYSCONF=
IGDATA_NAME; export GIT_PROXY_COMMAND=3D"oe-git-proxy"; export NO_PROXY=3D"=
*"; export PATH=3D"/work/isar/scripts:/work/isar/bitbake/bin:/usr/sbin:/usr=
/bin:/sbin:/bin"; export HOME=3D"/tmp/tmp_61yteqn"; /usr/bin/env wget -t 2 =
-T 30 --passive-ftp --no-check-certificate -O /work/build/downloads/linux-1=
08bab72978d4ec29ef6ac32506eb1783af599a2.tar.gz -P /work/build/downloads 'ht=
tps://github.com/siemens/linux/archive/108bab72978d4ec29ef6ac32506eb1783af5=
99a2.tar.gz' --progress=3Ddot -v failed with exit code 4, output:
--2021-05-10 13:12:51--  https://github.com/siemens/linux/archive/108bab729=
78d4ec29ef6ac32506eb1783af599a2.tar.gz
Resolving github.com (github.com)... 52.74.223.119
Connecting to github.com (github.com)|52.74.223.119|:443... connected.
HTTP request sent, awaiting response... Read error (Success.) in headers.
Retrying.

--2021-05-10 13:13:23--  (try: 2)  https://github.com/siemens/linux/archive=
/108bab72978d4ec29ef6ac32506eb1783af599a2.tar.gz
Connecting to github.com (github.com)|52.74.223.119|:443... failed: Connect=
ion timed out.
Resolving github.com (github.com)... 52.74.223.119
Connecting to github.com (github.com)|52.74.223.119|:443... failed: Connect=
ion timed out.
Giving up.


ERROR: mc:rpi4-jailhouse-demo:linux-jailhouse-rpi-5.4.59-r0 do_fetch: Fetch=
er failure for URL: 'https://github.com/siemens/linux/archive/108bab72978d4=
ec29ef6ac32506eb1783af599a2.tar.gz;downloadfilename=3Dlinux-108bab72978d4ec=
29ef6ac32506eb1783af599a2.tar.gz'. Unable to fetch URL from any source.
ERROR: Logfile of failure stored in: /work/build/tmp/work/jailhouse-demo-ar=
m64/linux-jailhouse-rpi/5.4.59-r0/temp/log.do_fetch.253
ERROR: Task (mc:rpi4-jailhouse-demo:/repo/recipes-kernel/linux/linux-jailho=
use-rpi_5.4.59.bb:do_fetch) failed with exit code '1'

so whether someone meet this problem, thanks for your generous help.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/71b9b404.86dc.1795674be56.Coremail.caohp19%40lzu.edu.cn.
