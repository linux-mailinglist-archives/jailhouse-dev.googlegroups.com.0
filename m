Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBLUKXLYQKGQEJJDZBMA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC1D149F06
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 07:37:34 +0100 (CET)
Received: by mail-wr1-x439.google.com with SMTP id w6sf5611403wrm.16
        for <lists+jailhouse-dev@lfdr.de>; Sun, 26 Jan 2020 22:37:34 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580107054; cv=pass;
        d=google.com; s=arc-20160816;
        b=uG0S4nlcR58UDmY8tS+KnUbPXyi6J8uK+Z20yPKTnBCwMUm/TTOCwDI9xkDrdRy/Fm
         XHOycUQc2P7KGuUaOwfMw2Bh3ceY6RiczISrebWOm9wSIEOulhiXpdL3bjfLkpo6LcDR
         WNmKcyroJSRNALXZ3JYGBXgacxucakAaPy2z0f70fGAOSP1BRs6WWORfG/IaG33twnSB
         bmsf0Z5wS+mpiAJ3McQurlkhmm+Inn234duKrK0cCc7eqELbI6JZ8OWHnaBVqMwTZtTU
         vPewurDGwPI8wD5gbw1F8ZOg3MmbSGLZq15VHD2lXvhu5wInoaI5YU2iCPAizLv2IzsO
         00iw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:message-id:date:subject:cc:to:from
         :mime-version:sender:dkim-signature;
        bh=g95aW4W9hIM9adCVGaTEd8ZMnT93DALXmQLvVkXdISg=;
        b=jD/dxm9i2QqtyHqnHogmwNkJt/SwDbNYslhBcUOBYxNjkWvIC03lZyjH7lzDhUl7Po
         2nWOJ5tU6ga3Wx4UNMJy229l0xUzNh2sK2qHpjGFGyJ0UQv2HePmYRMij5zk8pzya/Kw
         rxZdTbakqzuzm8fEUfFMS/sxImWKLexeTN7e38cdl13zMVBZ+pGIonDyeQUlGe+ZaIbb
         6fSOerVXnfA0hOWHPNNszfgktmJM9hsS30IOLwAYtLRwK/WS58D8GOP8AxLBPlusWJ4d
         /qy+DENawHdJoEeNLrXkTs6jyehdBq+I30G3tePOlEOf98pVcIyXwFbVOWAcIk6Xtzur
         myIg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=qUucFWvr;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:cc:subject:date:message-id
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=g95aW4W9hIM9adCVGaTEd8ZMnT93DALXmQLvVkXdISg=;
        b=naA6UPmnlWpgBkthFWVS/D3KLFbNThYCVJzQ9zh34cTLSfL2QZDzSD2A64Sx8nY/DO
         f9eJTyGNedQw6a7repA2oFj2pAQrfRhqXPq0WT3TvyxSWmavoyZ6ijKVrV4Z3iUgZuz2
         Jh7fQIYrjUkZdgKNLbfPFQAQiXZJwT0fw29qeSpu2J2mJuf7kC5SmfO2g5E+BufypbBg
         Bfpfr0dwO1QUk6ALCF7jwyZaMaZYsHpWPMyx/sohsFuYpyG91nxVKI4QoaeruFv/7s7x
         DsEUZfgeUEk+nj+sYZAH90732aR558/3tVme/bBMPmGUbcFNS90RZiY69IWwM/vx377/
         qg9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:cc:subject:date
         :message-id:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=g95aW4W9hIM9adCVGaTEd8ZMnT93DALXmQLvVkXdISg=;
        b=G8c1FfyTnHBgdSy3x8Oqvj0ly96kGED2irUCnn0qM1/CosWFQIlySnJeBS2Bzry/U/
         5A8VJt78NT0lZ1V22JKJpLb59jmgZNbVkc9+hc0ORYY+v8qtxmMWMPm0psoCti9GH9fZ
         0rl6/qETconUHnivuYDZQEIxJrt/4S4E8aw6GT2QKQQdNHJykDEp/IS4s+YboAFSCmJW
         1oz76Lms4a+C1RWRgD5FTV5+iYO2D2KPnH9PLEXdcO8G5NOKWQ5NAA9M8bVLAKx8namI
         tO7SdkDEC202uokuFLawxo8DspRMVd3/XJtDVST+MQBqtJTpAqfJD4c0OtpXe0BeHbya
         O7ZA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWt8j9wARB2/g13cHYOFS1DeON6zg5UG8xGq/hu5D1AFOZkGLkk
	8DGkwzz4fwJ8zvEQeGWccZI=
X-Google-Smtp-Source: APXvYqwMyS8hL7q2oKbIXdo3hw0S46KimhiUnQ2TB5bjRMeur+QyRR8gl5tISPyEZJFp+3yj5PnVTg==
X-Received: by 2002:a5d:4d8d:: with SMTP id b13mr19625398wru.6.1580107054259;
        Sun, 26 Jan 2020 22:37:34 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6650:: with SMTP id f16ls6090788wrw.4.gmail; Sun, 26 Jan
 2020 22:37:33 -0800 (PST)
X-Received: by 2002:a5d:40c9:: with SMTP id b9mr20374259wrq.419.1580107053726;
        Sun, 26 Jan 2020 22:37:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580107053; cv=none;
        d=google.com; s=arc-20160816;
        b=YUjfQ/pXtJNqkg4QLVnK71n9tMcuuiBwfAaBkjm8DtGCxQFkT8z+eROjoCfbkIJ6ze
         GcFCYq772ZEBVvXUxXRMXCj6xDDYl7XAcwUMvfQ+cQDKacSs+yWSk7mfARNYBWZeqI6H
         lpIaqIr59KMr9V80Oypo3+FQHU/wOh02TL7zq6WggrBkC+tzF4EJP5YHP9XWibV3SB8B
         fCULBLihtx4n5edE5a9HwLEym88qScLTk09ZlELWAxbU4/HhNtdmtGEtns7bra6jQAQi
         rIfqvOzzyUxt5nnjmJHaNg2BKu8c1mtrKxI9uLxIYkK1pvIT9qqIbjTr0Hxbjm9Q+T8k
         Ddxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=XY5u4MGQH5Y/SMgzp1u2dZE84EFqyICEqC9hoIzmw/4=;
        b=wYCgLCHqXDjQwOiU9GNgka1phTmkE08lxzR2wujxXrXkh+mC7ia0E8QY+RcQoS3QNM
         uIYFiijy1p9hVuvaZ6XRtaKC2AZGuz4FJ7Q5tFvBGXpbjjwChexJ0IamzTxvOBI+r2sH
         62zlHWZsDj6jUVFiVgw1xwY4UDHJoMkEx0e0EjZ3SIoHh6+qB0vXB6ncDXkn0Axm81pi
         iqKVPWPrM+9zldBoNW7CLgIlg9JgEe0aI8DPTmQXb6ZcD8fer+J2igpDrsOklItF3R9E
         YPnP5Ltgt2IenIRKdonowyI8TMvIp8kdQP5+ZfRhkHZNGcHndSX9JdxayDWAL5Bw0haX
         ZPmw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=qUucFWvr;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.12])
        by gmr-mx.google.com with ESMTPS id y185si261396wmd.2.2020.01.26.22.37.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 Jan 2020 22:37:33 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) client-ip=212.227.17.12;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([95.157.55.156]) by smtp.web.de
 (mrweb102 [213.165.67.124]) with ESMTPSA (Nemesis) id
 0Lo0ZA-1jXFmn0xqK-00g0sV; Mon, 27 Jan 2020 07:37:33 +0100
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH 0/3] Comm Region tuning and spec updates
Date: Mon, 27 Jan 2020 07:37:23 +0100
Message-Id: <cover.1580107046.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.16.4
X-Provags-ID: V03:K1:gOBExpFewL0is78y9HEAHUVCHpeL6fm7cJXEuxaSKC95NxxZD0t
 QwbwFJgD05YcnkWTeBHczgjlYu1qkAAQ97ZnrkCHSERirDfIZR+/69/DA+VsNEu0NkEgclJ
 iNphIavXb/LjgB6lbtiTdLdfLdwgbErarje2hPTxkzEd/Lf/Zkrg+PjaxwWImQ7vVbR1zca
 IlaOWv5Oc0ysQ274K06BA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:5REhoO4qt/Q=:bALCAfg65irEYqhx4N5xN4
 uyjcatkM5DnQBGYUj4apxnlHp4jwvTN/jGT1L9S6wR4wC/oDuW0U6MgSDvBLa025mpq0Vsu8G
 9nRpWTPrkfhm5DLFTmoVdfY4DE3yDML0edYP78bwvnNY0ubOdpSGLYO8MFQEDGnOCzOUcDrFh
 sflrtsr70/g1O5bHxGpvV+UBcdv76tzU4x6WOxxhBHfEkelnlYxPnP/DcVtJsYmhJw+Ma/2cD
 cjwk7/DiSYE8NiLMM/EkVNDBk2R+Q6JTJ4i9csSk1lLk9ZFFaOK8/8eXW3R3iUDtwTmQlxErp
 U1DvmfRnoglIlVRNiQbqPkZlOAZdLzdVcbDePAC8rr8/9wvINLIEmnhICIcCqHr37HMLT8ffi
 tSrv9RF198kbXBZiR7/blSC/vpuFeAFHGTZZjnwVhmyBk1N/+BzqNiOrBz+x6TzcwyRZnv6m7
 fEgqoNXB/+KbKuOKwEL1HTpHMNiWxmij8paqVThscX4flgqOA1TTxHyayZRJe9S1kDMghkyTc
 gUXy3xqiIf/dd/lEdcIqn0/lcsJqa6LOA7wNInv4vT4XEJxyc6XRZCsrlHHyyR2N7mzokpWMB
 R3PMrXJ+k1TA0G5oQ0L62EcrulyMaz1kP2FDgyjW6qDtnEEmTdPAv4YJDgeiAfF1+HMAE0O1m
 Dalkg3M0jUWO66w37WMD77Kwotu/USEDSnns9GV0sD00veAI0VsHhUkRsbdJaG4AwoTTZRa2x
 cuZdzW0sCnxdWfJMCVwpfcaOehS12EzJbNkEPFlzYQf6/ZO2o8rwShS6SUKmHCKu1lMnzkAyJ
 kj0pJcTMUmIRkwVwvcKAZCC+jK1boBdeZPqfumVUo1BDUjVot4nJUsmSYqmtvIvjtv2BLtfkq
 t3ZcxfXo/0ayBNG/08F71sjASxcMCYMwK3pM9WzSvdIu0asuuJy1JTO2Pa9Vrb+qZPu6EVfzO
 aaz544WN4KqqKS+O+z9ESqSnYLhM3oB0MB2Y4OKwkwMGrS/5VNrq6RUQzlNykPOWP3evhd1AK
 Ub+c6a2fQkQn+Qsf8wQgntm7cmCk2puP/BHBb23JdLsRJHgmwFlnVrVn/6kFcvTCpgjEshMMU
 p7XLICa3G55Tzngt6M5u5V9wxs+RlX19Vwud7Poupqnz4mhSbSqTIQWKyHyfuRDuUPi4FkzUZ
 Ps3sCdwHk9eiIPPS+YpNYgK7fwmaxACoS4wVlQV0BwiOZyOtdscPIK2JyvrtMXzYwWbsy33Zs
 /u2EM8UAIB/rkkTU1
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=qUucFWvr;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
Content-Type: text/plain; charset="UTF-8"
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

Primarily an update of the hypervisor interfaces spec but also two
small changes to the Comm Region definition that were triggered along
this.

Jan


CC: Jan Kiszka <jan.kiszka@siemens.com>

Jan Kiszka (3):
  core: Tune comm region's flags field definition and documentation
  arm/arm64: Pad comm region to natural alignment
  Documentation: Update hypervisor interfaces specification

 Documentation/hypervisor-interfaces.txt           | 152 ++++++++++++++++++----
 include/arch/arm-common/asm/jailhouse_hypercall.h |   1 +
 include/jailhouse/hypercall.h                     |   8 +-
 3 files changed, 130 insertions(+), 31 deletions(-)

--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cover.1580107046.git.jan.kiszka%40web.de.
