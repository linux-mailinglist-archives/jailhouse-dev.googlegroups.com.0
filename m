Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBZNNYTTAKGQEPCUMOBI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x337.google.com (mail-ot1-x337.google.com [IPv6:2607:f8b0:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id 36777158ED
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 May 2019 07:25:59 +0200 (CEST)
Received: by mail-ot1-x337.google.com with SMTP id 18sf5392816otu.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 May 2019 22:25:59 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557206757; cv=pass;
        d=google.com; s=arc-20160816;
        b=j803Si/TNqaHWObEdEu6BhDPsFsGeidKwmqdsleYKY3kyH7qqCUosP2/85vW2X/axh
         VUxaKVsMdiUYbiiEDhCZ2C0RDK2PBXT21qmWdCwFMKJb66gFBm2odtB4oKvNba/ve8uc
         V9ye8n0BYyof06QkNIQV7GkbIZywcJREysbUaBrQoqFJoOy/fChRhjVbCnOcK1wXUWKW
         hXKnqXGVA+1+uWRTbgJnNoW5Uc+Bpwm5drnz2PS/G+GjwDyXE+KKB6ffjdQTTbsuDYXr
         xLOTH0VSK45Z9qBCl/r0fBN/mZfNS+mmGkrLopbBD01ObGY3b3BQ8eUUy6X/iOkOruWB
         Ux1A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :mime-version:subject:message-id:to:from:date:sender:dkim-signature;
        bh=msdMoogkxv3tfNvmVjJlk9WMHalxt9S2MtezrP6tuY4=;
        b=eZZL4hVj+WuakPOFgoRhWh94ecV/HVy2avVOmOLQg5zCczJRd0PD+Y0kFXlb4BcY2a
         QXLQlAlfii/TfwXPys1k1JOiM66Oip5fhCiCjVqXHu6d8mEADewMdgVVGU85jBNnl1tY
         ZeVeX/SmcSGeufGco+rFZrRchLYMjkQ4Yip8EvyPhveuetbwVsV3Ap1TMUk2KOqrgcXl
         0Mr7+8ilU6gwkkEO9csZQFqGW2xB943OR20tNEg1uTS4/GS9B4T99ICQluXpvOV949tI
         3yzb+n9zRRN2z/V/sOhRQ1joD9O06UBjS8ahpHxLVWLbx3lFdbXYY3bZkN0SH/qnvEV3
         w0KA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=thD9ty7k;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.196 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=msdMoogkxv3tfNvmVjJlk9WMHalxt9S2MtezrP6tuY4=;
        b=K4dWdIsO6hDfsowqnwcAayfIMezYTDZSnflDkAOvCbhfgJg4EPx0gcyn/Ez/0QSsX+
         DETnIvY0aEH7HlYL4Mdyp9gcVKo2miPx/1jGgPeH0dcPyxMICxkG2v15s5JOY6hNpnzZ
         liO1qBsQV5NSBXRST0/ImiwfaQFgid+YohkAIZuo85/kw3jPlaLGOqIkiHhwyJr+IS8R
         eHpEEKCH7iWGCsYNs+1A6Ds3b+WScS1AHXxohHIsa7VPi2IuDfrfGzPvKu41f8FdTg3s
         mrJMBTpc/BGcoflW3ywpGBlLq0Gie2Dk71mAiY43fOzITNMj369YZh76pQ0YVm+Fc+p9
         mtPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=msdMoogkxv3tfNvmVjJlk9WMHalxt9S2MtezrP6tuY4=;
        b=G5lFsZljGyStOIriAcfRgk1ERgETrWLZ5eS/YSC2sfcgdBZxcslfcl1qW2M438mkKD
         6g4WHOOFGyK188X8M8ZT7IUG9hseGjGuq+q8buvW84x45sC8s9Q/BSz/khCHPS51HLN7
         qqjkVUE93fUY6BmKjSUCsZiwXnidr7o5IjZOF/hPo9B8/sO+UUeUhaI9MY3NrMboQ1pJ
         /HkcWYDPhVGlr1KiBNQZLhY2sAoWJvEaVXQy7NTdGaA9V4RLY9mAqjEC/jrzFKAUU5pN
         LqktQyG6BEHk3eJDUv2N9dRVIG2P1UX+jf+5OoxEe6nOOz04MTXOwqXUNyOGi91FTNkc
         VXJg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUWdI5WGqoSFwYN3+E+hhcrerMU7sEJBYU1B8Grry1afSGf04xl
	etpqrJC8svDXrKh6eg6XTaI=
X-Google-Smtp-Source: APXvYqza8/sPm6qHOQHcf4MTFGZFip5G/7q3sq+PRX9nQ7/vJPI7aUe7rq50hwyGV1pv/B/C5Xteeg==
X-Received: by 2002:aca:540a:: with SMTP id i10mr1291781oib.54.1557206757635;
        Mon, 06 May 2019 22:25:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:4903:: with SMTP id e3ls2577933otf.6.gmail; Mon, 06 May
 2019 22:25:57 -0700 (PDT)
X-Received: by 2002:a05:6830:1415:: with SMTP id v21mr20799518otp.307.1557206757077;
        Mon, 06 May 2019 22:25:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557206757; cv=none;
        d=google.com; s=arc-20160816;
        b=mjINiDILtoO+kk7h0+imjvSjD8BcRMRC8LG5QnCQIkp58ZA/4/1KGCJ9gJSVpLDB6J
         Nbc1vloxrE+DiRrIOuTSkU0Z+/oQRfk7CSS0sYQ05RCSunjZq0QeTwR8z2bnCt/agOxy
         teh+PRsCVRp3S0B8I1TfTPCsRorceUiLOoyMQ4HBFnfjEPHhlQAiIpKn24sNntdPyPa/
         PDC4SVP3cEkh/0UT7GjPWjPkV2FrTZJ7EDEPyg1xdA5vWunQhWb6/V+oqHfcbXcpjQw2
         vvRhxa723f1gJed+f44WmWrXENU7kewDvk7bCH1114m0nM2RRQRz3J32rbKnTOzn/RpW
         CfAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=ORc9QRMYo0s+tg2WlnevRdaogAKt0bMSUraeDE6O1nY=;
        b=dkx7tV/4Q7duk9eKrlviY+WvWIKdYF3BepBueILDZrSyHKMU7GCaXbDFVDSxuQ0Nn/
         Y8+LKp5Ym4RCYU+2Wycq9/AhFTCKYWqoDJ3edwRFns63KBnPwz8kxmlePQhYcIgn+p8k
         ype+AIXAB+wDu08lCrERT4HoSe0r7UiRD+l0K2HMdgcpn5nHH+QRBhQ/Qqji+0701OAR
         fYHUKkBloCx84+HE2hJD0PYNPa6u6GicIEmVSBfJe9UK7isJoAeG7NVytk1U5+wFK9O8
         G+IlOn+OKJe/Ak7AaaTDz6TrQv+0PUaX1Gko1Vk8uQLD0Nfhvq2ImKy5q23h30zjputd
         T3Mg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=thD9ty7k;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.196 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-13.smtp.github.com (out-13.smtp.github.com. [192.30.254.196])
        by gmr-mx.google.com with ESMTPS id e9si115125otk.1.2019.05.06.22.25.57
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 May 2019 22:25:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.254.196 as permitted sender) client-ip=192.30.254.196;
Date: Mon, 06 May 2019 22:25:56 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/2b1abe-557fa0@github.com>
Subject: [siemens/jailhouse] 557fa0: kbuild: Set our own KBUILD_AFLAGS for
 hypervisor a...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=thD9ty7k;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.254.196 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=github.com
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

  Branch: refs/heads/next

  Home:   https://github.com/siemens/jailhouse

  Commit: 557fa0de3f99931f80d3abd8a9fa774f474bbcb3

      https://github.com/siemens/jailhouse/commit/557fa0de3f99931f80d3abd8a=
9fa774f474bbcb3

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2019-05-07 (Tue, 07 May 2019)



  Changed paths:

    M hypervisor/Makefile

    M hypervisor/arch/arm/Kbuild

    M inmates/Makefile

    M inmates/lib/arm/Makefile.lib



  Log Message:

  -----------

  kbuild: Set our own KBUILD_AFLAGS for hypervisor and inmates



So far we relied on the kernel for providing us with a usable

KBUILD_AFLAGS. We only filtered out the enforced asm/unified.h

inclusion. But this is wrong, and it breaks on ARM with Thumb-2 mode

enabled. We should actually define our own, stable KBUILD_AFLAGS.



Reported-by: Arvid Ros=C3=A9n <arvid@softube.com>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/siemens/jailhouse/push/refs/heads/next/2b1abe-557fa0%40github=
.com.
For more options, visit https://groups.google.com/d/optout.
