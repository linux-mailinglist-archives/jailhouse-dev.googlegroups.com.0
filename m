Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBX4753VAKGQE6Z2SNHQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73f.google.com (mail-qk1-x73f.google.com [IPv6:2607:f8b0:4864:20::73f])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5339572A
	for <lists+jailhouse-dev@lfdr.de>; Tue, 20 Aug 2019 08:14:56 +0200 (CEST)
Received: by mail-qk1-x73f.google.com with SMTP id d203sf5920217qke.4
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Aug 2019 23:14:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1566281695; cv=pass;
        d=google.com; s=arc-20160816;
        b=qu9TXuGnMV1zaWPsLi/VIREr7Blm/FNedJ9yhYeViSDhtOMSZ+VORCTyq5elxiWoTZ
         fC+Tl+EEgHqfN5G4W8UD+7MJi4sqenYCB2rpnDk+RXu0H4jlOGJWJEbwkZMs1opZeJEU
         VA2GowYl24t4kqglu7eViNCy6vRJR4Cbea2JnxIEgvzmu1pGeK/M1g5zoqUuCfFJaGeP
         9IP0JSinhDrFuO9IFEAdIGXumzCMmtvZn23k2prN7WHdulDCHV/zCRoCVcT9diYQ2Xnx
         0F2cDSr7i96uGUtbBazT1qqVE9t69z3qLoun74+2uyWuKuCoH7P3Rg1iF+41lQ1WP6Dv
         3g/A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=f2RKi1eSzi0yZp0+jP0USubbSZZXAp98m0iwbSr4LQ4=;
        b=qzOI86kwFUcZdpkUDUBLixiSvmHuCSUjnOBAhrRlzwX2YEnK3sjYyHbiWIE/96sZI+
         aDFmPoe1VRCB9ho7PmFPLUV7IgZvhgy/RZSpe0fqZBQwoaDKxEwno9eZmmFkJDAvsDcV
         Oapl0PJyj+19mA6Oj/1gp4doDiCHGsQ3n83TK4TwEAJHli4ztb3y4DMXy4LE68uNA01F
         Lk8JOWxx8zFjcA+txurN03v/4Aevgy2nKM5sjNJ+tkW1fVrZPdXKVZyO1WmGh3XstOw0
         ZAWFFnRsPp56GJ33h7syKi8F6RKpNkMhYSplAVGgJrF68RNNvb2xleKQnYfWTooXSy7h
         n4gw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b="p/lJxjWs";
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.207 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=f2RKi1eSzi0yZp0+jP0USubbSZZXAp98m0iwbSr4LQ4=;
        b=Njh7btcV0tPQ5UqrMkny69RiJMPV12wjpdbzaolBHmPhI0A0miRjmfJC0iE3l/S1ZE
         nSSWrd/cp1TKhdnRayuKp0ZueOBPgUYGWxexMGk6CYP9ArJnigeypMNkKbkLhrg2fooF
         3pW2Wq+WFlhkfXqHFgi1PgnNu51ItK/DDKR+9SGlfMYEhSa0QZQZtQGVH+fexEZo0XWU
         yOj9Ej+rlQb5mht3y5DObkqC7Ezdr/upcO9GLxJFW0+DKqjyCOclLVqVjD4xfTSzeSOY
         v7TfyUnhJmuK+LFfzArHfJa7JR+seOU8j8qI0vk9i4ViUfj3aeOQZxiVpP51zOuvhAlp
         wO0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=f2RKi1eSzi0yZp0+jP0USubbSZZXAp98m0iwbSr4LQ4=;
        b=ssMoptUj6ldkMFzKzknBeTb3nd2cwaDSjV9X4LNIsVmkEPPKX576LBaqLm5jSgwtAu
         xuoXljvvilQGJEwrRo06eLFYo0J13sT2LESXABeJUd2l+/HO0bUHwOXSTbDbtMGN5aB8
         WkJSykgdLZwIIOgjN93ySID8uDJYWRVixt8tei1qRQP/SUhAmRogVeRBgNXl8F+dO2KW
         9ibRhvJKtVDQyNeRsKdg08U/1neqo8WsW7AL3teAqhSsV+a+tz+YbQRVkjK7G8H5Cz2V
         G2/LiJohwT4kPM4mbCG3RtH3r5M+eIiM89TBoTKTe6OI0dFeJnX5LRDDeyX+tuQbakn0
         wiuA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWK8XL0m7paAoqiugjXJ2bXn3rNFwBDceEi9qmHgPY1e6pe+7OE
	GSzegTYs39ss6LGOWwwK2XA=
X-Google-Smtp-Source: APXvYqwDJsC+q+6a38E6dJ4AvNkSXv99x+fFx1kWbPfgxhBl7CItLF5M9SnktAeCJ4S3v1Z6lKKEuQ==
X-Received: by 2002:a0c:928b:: with SMTP id b11mr13448159qvb.209.1566281695321;
        Mon, 19 Aug 2019 23:14:55 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:488e:: with SMTP id i14ls5599758qtq.6.gmail; Mon, 19 Aug
 2019 23:14:55 -0700 (PDT)
X-Received: by 2002:ac8:4691:: with SMTP id g17mr24550340qto.104.1566281695053;
        Mon, 19 Aug 2019 23:14:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566281695; cv=none;
        d=google.com; s=arc-20160816;
        b=Nfwx5b0O0kGfGnSBkFGaKyflNOzmmt8jYPIl6D3B+M18aC6AlwPwlVQybIs856QDvd
         MQ65tfcvRCDsd0Mkfiktf9zuIHYDBz8CMwmE960DH9MSjcgOGmQ5nLLaehWZS1KUb7aF
         Ddq8SAuW4/KpoHfUkocLW4aniL4MfyE3AsnXMaQ4INQIgqE42dC+RcQJF0k++O0VvtG5
         9opXZVgAormlLqP8O3t/5Lb6AYsAwkK1DAsZWhN+ctwXzeLTez+GGmYFnrkvNV+WAxmA
         KaP6T8GbU2UQb7xTVaS2lTTGZ6enoFjAhZ7mVbZoOyZ2ocXPOBiJeIh01kC+2vhJ70hh
         6z7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=Epqa0LCaJocZysqLIrsP3wkL9O+pNI1P5D3hnmRRL7g=;
        b=vHXngGMoFS/C22VToehf4pwtsksRtF4ul2iHnSb0s2PDTiUtzrAoBASvFTwG6RQbqg
         zqA1VSY24UwLfJfZMOTPN2Q9Bjy2jZM/9EixIQEUc+EaH8glzHL1dKNh0WVqF/bLHwHm
         l1qRxukkYK13ey4ysROQMSpAVppYlMkfhvz2iPg0ERZi84CyNs1p4uY8AhkKMF52/29Z
         ohIkXeNugd1zbUkgPyx4XtuD2NMc0YzRukk5D4XE1hbkwo92ul2d0KAM4ukmCRq1Bkpt
         XEDAxlhxqLyCbVn0PK3nhFu0PBFc3fcXEMPnagmAiqZweCjvhwT+j7rlOGUK9j8BJsa/
         SI+Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b="p/lJxjWs";
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.207 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-24.smtp.github.com (out-24.smtp.github.com. [192.30.252.207])
        by gmr-mx.google.com with ESMTPS id v18si904044qkj.3.2019.08.19.23.14.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Aug 2019 23:14:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.207 as permitted sender) client-ip=192.30.252.207;
Date: Mon, 19 Aug 2019 23:14:54 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/73a5bb-4e9071@github.com>
Subject: [siemens/jailhouse] 4e9071: driver: Fix backward compatibility of
 lapic_timer_...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b="p/lJxjWs";
       spf=pass (google.com: domain of noreply@github.com designates
 192.30.252.207 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
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
  Commit: 4e90716335a804e9372f79aa580c46e7b17e388a
      https://github.com/siemens/jailhouse/commit/4e90716335a804e9372f79aa580c46e7b17e388a
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-08-16 (Fri, 16 Aug 2019)

  Changed paths:
    M driver/main.c

  Log Message:
  -----------
  driver: Fix backward compatibility of lapic_timer_period symbol

It was not enough to only rename lapic_timer_period back to
lapic_timer_frequency for older kernels. First, our macro
RESOLVE_EXTERNAL_SYMBOL was not prepared to be provided a macro as well
and was still using the untranslated 5.3-name. And if we do not want to
break up that macro, we need to map lapic_timer_period_sym as well.

Reported-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Fixes: e7674ea7425f ("driver: Account for renaming of lapic_timer_frequency in 5.3")
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/73a5bb-4e9071%40github.com.
