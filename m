Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBS7YQDYQKGQEJH4YGQA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x538.google.com (mail-ed1-x538.google.com [IPv6:2a00:1450:4864:20::538])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E5213D800
	for <lists+jailhouse-dev@lfdr.de>; Thu, 16 Jan 2020 11:34:51 +0100 (CET)
Received: by mail-ed1-x538.google.com with SMTP id v5sf13613930edq.8
        for <lists+jailhouse-dev@lfdr.de>; Thu, 16 Jan 2020 02:34:51 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579170891; cv=pass;
        d=google.com; s=arc-20160816;
        b=da+0TKVRX3hhwlMCHIPaoI2nF4+IYujluqGxBam72ZpCBOYh7SECt82tBfmLT/E7wk
         cwOL2YR5486k2uzbW5GMsAyfMfYcq6ge8CWWJzkd9aJrKAFjOhJqPHFML5MjknviZMPj
         R2JAc2350dxdWqcQyMjgyHe/6GUYEjlft+00ur7S4m3S4DoiCGRx1HhG7sRvncUwXuFy
         Wqbvb8VmVU0ymlm9EpmF47fSK7wjccwwGDC0eiz8rCvUY/vplXfz9YHI+0sfdDyUD4rR
         E6xHTUaVsqJZ2AkwN/slwtyWxUqUozjhnbyC0RNzq7JFoacEeBxktSv3ALDu/bkN4de9
         O6kA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=jr2j3xOdL/5pnT1ysWBUAgg5WnoL4CGrzkXmk76SBqQ=;
        b=kYuxejkmUSRHXcFJh66d8nOf4PxRDYxg+SXTLHlqhBcXZfTgi87QLpzQo9X+74wTVD
         XwVLorB9w0v89gX+Dr+AAJ6VJBfNuu/Q3W2keQMdbmsh/XDhdjUkwOtkTUbH9IGPnLkr
         05BBPT7KHfrkpBArJ1DEUgR/8sP0HCc0LkzLBHfnXy1J+RDUkUOilZb4Ru0QVdjIUgdb
         hCKHvGzP0YINfFfaq9JNKIDIXiJQsec6zkJcJeG3ojDTvnuSSa/8Q/5scHh9zvEmnyp4
         LPWYnXhYQDJSC92d7vgZnNSUzqx9t5kKnj6LXnWBxS5RFTK4k9veS1rXcHxRKI6XnWRD
         WhTQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=jr2j3xOdL/5pnT1ysWBUAgg5WnoL4CGrzkXmk76SBqQ=;
        b=IoNqPmbcNEtpm9Qud/2tbxDe/LOtgs63TVJ4Irsm5zLrad7XFE+eYHebLbiIlRGAyr
         y5VqQ/JQ1J7QeWfL9Hr9GIzFUIyYA/Mmvol2vIImGgtC34q3LFkeuiosoXykErMkZ1xg
         FWJs/gVV+iY+LnW9rUu0sRkZAW2wOAo7LMpxGSqWGU9bx6XDZLgFsgluEVz803hgi2Du
         zTHWSekAEte8WTkX1oaIAWoqFNzJhB36HXEjPUjIwzxNq6hG//gdIq8Yh33fTZrqVuKC
         aKKuUjogXK2eaDHbzbZGY31HsNs7BRb8mhkKmkfkku+uk9jLjR39sNNsZdCF6X+967GJ
         WyYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=jr2j3xOdL/5pnT1ysWBUAgg5WnoL4CGrzkXmk76SBqQ=;
        b=Ny/pR4u2avgCcFPWSP75d+v5QMVrn5RHineTqlDabpaAv+GZAPubLswlOcPDUKF0pq
         Git5XluLwOZQDzasf7Zj9eTZ9CYXf3lFZJK/PdWDNQTlRud4CSVXIuB7YY/fq/bXhwWv
         QfOityhej9IBTURbJ/x45yUX9nkwTQO+WKDiiBNV2P54+cEebAMgjx0I2MjN5O26D4G+
         BK67vX+r6a1Gdm33TGtsReg1HGPjYNs98mPlPsOPnujJKoBwIWfTem5G2MjcCMT4Djpj
         oV8kp9Y/7Al5b0bkdFWtiWlSTcV20lJi9NevJQK86ehw/BKSQy5qw4KYAAXBjNe8kJ2Y
         KKsQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV852SwVd2001xOEBm575fl9gfiM2kF7ZC/03OlXTnaZDO09U/T
	A0qlyD2wMKlxPdsGvkTCQpY=
X-Google-Smtp-Source: APXvYqyGYMZoWoytusbsCyFjqFUBZ9MsL74tj+vV2aNYx57QamPVnNR2Cz850KApmIk/982R78Vq4w==
X-Received: by 2002:a05:6402:3ca:: with SMTP id t10mr35614203edw.278.1579170891322;
        Thu, 16 Jan 2020 02:34:51 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:c98d:: with SMTP id c13ls5033111edt.0.gmail; Thu, 16 Jan
 2020 02:34:50 -0800 (PST)
X-Received: by 2002:a50:ce56:: with SMTP id k22mr35669439edj.34.1579170890651;
        Thu, 16 Jan 2020 02:34:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579170890; cv=none;
        d=google.com; s=arc-20160816;
        b=zhvkFcwQAjpia8uOLBFhUzc+e6QTB5LFrpEe1i0a6QVM5PPxhd9PSvuQ5qfntzyjXO
         LjpKqT9/iuYUWI4sWq77PHFOxT4ThtZ2ZVDlZ5cE5WiTFiK5ynOrocTqzjGEItjbwxsX
         kkavuY/DHsusR1RIeH5epnedrwe2M4D0YQAFcd40HP6Gf4ZaTKxwjlMgJjwpna3Zgv30
         W/fByejEsH4ClQB/m/9hLrOuHlzvDrswlWdzPRNp4RmngmYafVdboCS7gx/qtEedV+wZ
         9FWIHud7RPra6Qwz2j0EFSHBMeFPJXYUWAxZ+I57QsEUMAuJtP33ghG/dH3PbFhwXpb7
         Z8vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=3xfvH2k04f+QFVe5Fvqp8ONa9WdQ4N+RSLpvoygOjVg=;
        b=zS3WUsP+12effxw6dtGiMDti79DUaLJLGlRPc7AkDlQtjH5TL+GwzpGqsrMj8ZyO0z
         9ippFzVMuyPByZZtvIZ/I70e3uDZwDthuR9LUYaAjNqFv1EjWSBP5vf5SCniwEzZMBU9
         LIJA/8fOMX3a+Oz3UWeodOrwbAgtB7SRqhvHDMlos0z3jU2nHvL06P3cGoBh7gH6nhCj
         6H+nar//fZZkpgJRCNw5mB+ADrYn65efw5mQHb852ZHB4kDbYRLTe+sZ7Fya8gcdJgn8
         dHIM/liN3nX9H+zQNYohd4rL2I7l0UCYgRxSEkJoJagmk1ZlPd/p2qNMsyWiu2Slo6RE
         0zuA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id w19si948842edr.1.2020.01.16.02.34.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 Jan 2020 02:34:50 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 00GAYo4X015309
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Thu, 16 Jan 2020 11:34:50 +0100
Received: from md1f2u6c.ad001.siemens.net ([139.23.78.127])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 00GAYmQS031623
	for <jailhouse-dev@googlegroups.com>; Thu, 16 Jan 2020 11:34:50 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 18/18] README: Add Raspberry Pi 4 support
Date: Thu, 16 Jan 2020 11:34:47 +0100
Message-Id: <875ed5246d2d3977ff5211c83e28167bd8b00d2e.1579170887.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1579170887.git.jan.kiszka@siemens.com>
References: <cover.1579170887.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1579170887.git.jan.kiszka@siemens.com>
References: <cover.1579170887.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 README.md | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/README.md b/README.md
index 4a0e606..ea3fb03 100644
--- a/README.md
+++ b/README.md
@@ -103,6 +103,13 @@ directly to the eMMC because it does not contain any firmware.
 The [Avnet Ultra96](https://www.96boards.org/product/ultra96/) is supported.
 You can boot the board directly from the generated SD card image.
 
+## Raspberry Pi 4
+
+The [Raspberry Pi 4 Model B](https://www.raspberrypi.org/products/raspberry-pi-4-model-b/)
+is support. You can boot the board directly from the generated SD card image.
+The mini UART on the GPIO header (pin 6/8/10: Ground/TXD/RXD) is used as serial
+console.
+
 
 Community Resources
 -------------------
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/875ed5246d2d3977ff5211c83e28167bd8b00d2e.1579170887.git.jan.kiszka%40siemens.com.
