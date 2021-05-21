Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBT44T2CQMGQE67I2R5A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF5C38C51F
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 12:41:20 +0200 (CEST)
Received: by mail-lf1-x139.google.com with SMTP id q7-20020a196e470000b029022ff5d290c5sf4781108lfk.13
        for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 03:41:20 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1621593680; cv=pass;
        d=google.com; s=arc-20160816;
        b=SuFinM0Sbki8Rjw+aVC/IGU8ZzJggGGc+QP5DQvp2To4FlQUzEybT26p0SfMwwnJyb
         hlMA9GmJZXYtSMbQbniNRXlwscUOP1ia8JDaFwK/0qHTvdKuGfPOqeMiXJWIJB25AnCu
         wvjPbWvn2ORqXvv8XtRb8hwulAfgcakaW3fpvWrH5/rk5mXX2U7JvhTfyxcESvpzFWWg
         OsYGCbXwiVd+V71HeqgYOGyRPnjr/9PnE+sZ2Dp768hktpPUqDI0vp8ClYgNbrAKGG/N
         1962tzGFajNZUz2rBM5ml6Q5KZ+Wj+nmePB2Z2aDrZEPog1dbBMX6zt4TATTwwQiTBnz
         c0Bw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=KWYJGCxVwihgOWjAnR3YDEHrPaOfICdeNmv2yI+weoY=;
        b=g6aBa3rzUgIp4E/LdioD7b6BJciV5jiuCAevPARAAdTifgvZ5fuUIxqdjmcfDi+fOU
         yszkYtE74evZl17ra4pR0VT5zNd0cgPYmjJq3jXtzKhOMMJ+ycgn97EhdKuRsTWUdUB9
         QWXVDI09zRtLuO1f8necxTPAInwgPDeSqCiFeLrshQkLVZjJgedEXgITTzbMcH/LQUo2
         Qyn1Uisy92TDHVq6aml4WcZdse2V/Bv7Ie+MWZeZrw3e3dMqQvdrewqsnnEc1ihPD0iV
         S/TLh4MKU5dZrd5u+O1q+xWdMZnxJ6hf14w3Teiy/1FJr4lmTPyx5Wuy+2I5Z0I+g5Ay
         ydpQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=KWYJGCxVwihgOWjAnR3YDEHrPaOfICdeNmv2yI+weoY=;
        b=f/E4RFOrzHdTyvYl3fW0lmKF+JXQu68N3wmw2hDnC79nz+lFnJyPr/9kT6218dPJGA
         WgzVTgdWlCTV02PiHV/ZZUbTEJkcakT08y6Mr+T9nCwMSIiKO8RPY8hdI8D1qZM78bE8
         4Fx3ocUiNNZ9OkB2RyNa0v5H6J4icZ4maNiaZ9UL8SutCHN471gkGWX7xduUd0guig01
         svJF1MZSzQzKFDsSWHOfCYE53Rzwr/FGDOjIQLAx94GBtSr2E+x1V+i7jxSoG7DDf9Lz
         2Gl7Ier7IgxsobBjWE5gpy3ctqdZMYVvMSVElOQ2TsPJv4GCRksLj0dQY1R8iPa8rmHO
         vn1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=KWYJGCxVwihgOWjAnR3YDEHrPaOfICdeNmv2yI+weoY=;
        b=g/QA0yV5D0IfoWmX0CPb7XFJHg9+pj231AMmmqcZxPa4ne+JWcOpBSB1wRrcFNzaAa
         QJ43rplPxxfDfWMQ/JhTytB4lmzkzweOJG/Rgd5QaMWkXew3cwKLS1+X/81T4z+gp/3J
         HGnl9BD7AjHymAL8AUTeqpAQzhhcQAKouuQQFZk8K21cacE35wDsFoAnuOPnjnNAY+Q1
         vFdv/LocEkRF8dipMC6rTAmiZz0Oma81iOeuD2hDSDrifFA3yYjeMZTxpRZ16IiWJC5U
         KVhl37qwUVg0d1lqO1BvcmXIw0jsQpeF3wW5AGc0ZjDN+71uznadYZ44TS8JKgDY0rqe
         OXWw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530fH0FtdpiuUT/ugaD2a+s8JMo51foxj+lVZwGotzUw8UZQHagX
	1UakFUDSFDQHvtAhBpf4F+Y=
X-Google-Smtp-Source: ABdhPJzWe3cDDgRXsrwUltOZFN45NDhlGpDrWK84OM7X+KIrOc2Kz6p4PL8Rj46GzUjfWMklc3LT7Q==
X-Received: by 2002:a2e:99cd:: with SMTP id l13mr6459071ljj.89.1621593680025;
        Fri, 21 May 2021 03:41:20 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:1025:: with SMTP id w5ls1148550ljm.0.gmail; Fri, 21
 May 2021 03:41:18 -0700 (PDT)
X-Received: by 2002:a05:651c:2121:: with SMTP id a33mr6331398ljq.281.1621593678837;
        Fri, 21 May 2021 03:41:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621593678; cv=none;
        d=google.com; s=arc-20160816;
        b=1Ho/CwworfJDcbqfT9BN9GUx5ICVJXyzLXifnUlfIXlSqAsDvWTg47LWNJG8JT10UL
         HzzfoNjCzMb76D6aFpQJRmZ2vlUJjI1ew+Y9p8z+mG5CpuwYTgIJgDJ0Q59xnfVPXPKA
         AWGqP3fTzrH+T1/bFS6F3RFhiQQBfo64Tjmshj2gMfFr5fZeIXS7ky0BO1P4a/MT3y9f
         65QKr4FoY/eGwPRX4jrO6TPy5BhQ4Nb3umph0mvdIKcZactsTEkc+SryT/auUhx+b3/6
         5WSRAm7ROKnUJ6PTKi+ZmvH2L6qxZeUaWpx7cYy3eSwQhL3cO9IOg2Y8b4ddvWxcpyA4
         4r6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=v7tDF0rak6I1ACVOkpHIACMm0R2wS1q4eAfYbgJZeZM=;
        b=CxuD5/tI03Gbrb16Nb9melpUyYfJck6e8hSVS8llz52yJDn2YGvcOpzxAsRnesVmHL
         1owBakda3hwzjEKs4vEPxVcoe2F8vNO5u6G06fsNDhf/55zalGaPDW8OkIC3S+lUn5sD
         YnZB7DCAGjxsWqApu1uTqvH8BehrmYTNXpO7aELxNN1ZQBdZLzAldC75yqkE/q1GD1Uj
         SlFg1MSxZVWtUbDsO2LwkwoLUL36Zru5lZwF/arCJoelAYcCS/+eG0+HLsdbMFw5DMy2
         GnYz9XshKLyb0jtSax+J0q04OQhQWnpdMz1QzeTxbHxgGLPbUmUPXruNvt5XDYwjuX3P
         V2lw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id f11si22721ljj.1.2021.05.21.03.41.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 May 2021 03:41:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 14LAfIfQ021732
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Fri, 21 May 2021 12:41:18 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.240.49])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 14LAbYcR032504;
	Fri, 21 May 2021 12:37:40 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Cc: Henning Schild <henning.schild@siemens.com>
Subject: [jh-images][PATCH v3 22/22] build-images: Document --rt
Date: Fri, 21 May 2021 12:37:34 +0200
Message-Id: <5487453163b914a0d98c04c2103c8e3c0a1fdf7f.1621593454.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1621593454.git.jan.kiszka@siemens.com>
References: <cover.1621593454.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

From: Jan Kiszka <jan.kiszka@siemens.com>

Reported-by: Henning Schild <henning.schild@siemens.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 build-images.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/build-images.sh b/build-images.sh
index 7b5d071..da24867 100755
--- a/build-images.sh
+++ b/build-images.sh
@@ -16,6 +16,7 @@ usage()
 	printf "%b" "\nOptions:\n"
 	printf "%b" "--latest\tBuild latest Jailhouse version from next" \
 		    "branch.\n"
+	printf "%b" "--rt\t\tBuild with PREEMPT-RT kernel.\n"
 	printf "%b" "--all\t\tBuild all available images (may take hours...).\n"
 	printf "%b" "--shell\t\tDrop into a shell to issue bitbake commands" \
 		    "manually.\n"
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/5487453163b914a0d98c04c2103c8e3c0a1fdf7f.1621593454.git.jan.kiszka%40siemens.com.
