Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBO6LT7ZAKGQELQHMCMY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id E50FB15FE73
	for <lists+jailhouse-dev@lfdr.de>; Sat, 15 Feb 2020 13:36:11 +0100 (CET)
Received: by mail-wr1-x43c.google.com with SMTP id n23sf5650178wra.20
        for <lists+jailhouse-dev@lfdr.de>; Sat, 15 Feb 2020 04:36:11 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581770171; cv=pass;
        d=google.com; s=arc-20160816;
        b=fwG4P7Gf9NETfMFU6+1Gyq/yHVX5Q+vVdUPeFrWnA/fvW1/JX6X0mvJyFEO68BFyhl
         tgrEJXuHic9wxQbUzgMp+aSXIYSNeO9WxcjZcNkOEQsU5XTSzXlD+1BnZtzy0HWhHwLB
         NfCk9OH4mFulaX8Ak7ct6t2VAJ+2RFKoXdUj8ZrptJIh9mB6w390HEyyUNPRUj3ALBcr
         j8VQZ4JhViG+Cxpk9wwnnHqGaGzRxkI272oiQrCkoyzULFjG9lR3YN/kAIYtKqza0UYk
         Qy+TFEgTR2fKyPsDpDYAGhxGJrYpcmprgWuzwooFFBtoSSlfUHjiXGmtKEjUf55JiqOx
         w17g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=INQxbEKtN/eFQH8gaLOXSMdywu0KdJjSWcwIKv3hg3I=;
        b=FVKXUAwoA6SlItlikUGV9Xktb/exFxy+VqxkulmMPMYMy9eruq2xf8VJBv9LP8Fy6j
         Viowcki+QH12xpnsVzr6/wbcEKnZ9lSXqEXKR4s8xa/GRjKzs1Ts3cDVJMl/XbylStCn
         15y0H/vXqHOQ9zmm4398ifMISlI+ajuFcgL8AioKkAeR7QDejtFGkKy4ZhLp/863sIYi
         xT9nHqV4wN9awGuA5qIrVK9pDflOqlJIldg4ag7AAvSrO71A4z41KiM9ss8zN30y6IPv
         /fEYSnmWQssOxTPH/m2ODYbhgMgd6z0WXiWTuuDgmVljrOMfDbPNjG7G89gPF4ExQvG2
         BYIw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=YUps01cz;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=INQxbEKtN/eFQH8gaLOXSMdywu0KdJjSWcwIKv3hg3I=;
        b=PG1bq55HRH8QKhdkkZdK/OWztQjZKOJywWPT/UF8mi2d/gDY4vsUgUkCQjgIONlFNY
         l9t73eDwsCz8/lg5JB+u70Oy5jRTYFJi/nHM72fCYr++yB09uMJgQ1b48h+bP/Vopz2B
         Sqw0tVaiH0OZjBUEwn5UxAgEvkVStWC2dSuqIFtpQjDbraQNm0fAT1DBKmfwCOByntlk
         6r4AtP9nJX/M7qfM2dohSgM6gESaE9hbsZartEQfhi5v6kwnkT9ifjGsiD7s0vlavcr5
         HOTAeFA5n5imVwr6/uiGyMG75ac1Nrzb3UuQUG8JABrErjyZrw/AO6jpu3daWSQgz6Ma
         JASw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=INQxbEKtN/eFQH8gaLOXSMdywu0KdJjSWcwIKv3hg3I=;
        b=LhQJPpeJ/PB3c7yfPppo/XRR7j2tP5ZLAX4CGR8CgIomlQzIPnawiURU4/P4p41A1B
         E4wAL7PW/K7PzkCf9r9Wg7R5P2KECNvZd+gerABZ2b0M4TJV7jKxMO7iw23BQvlwxXRY
         gwyzatJogaf55miVfFBsw7EI+Da4bNsgc2jUonyyoPbmsISMFjkpQoXih2IQdjUuo/5R
         DkadqOJ08vpazLPNP4zPI+BQEKUVKbMi6KHUATJ+MnISzkEd4bZCGpf/uD0nOAHcbTQP
         xN6S4U+ypp4nMP/zff284Di1AtKiKtFbf3+N3NYmuB784STKWWq8sqcv6Qc9mHR2Wj58
         sqlw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWZ/dvq2ux2e+paxgWHMfJqYjASe+AubMSBPXOvAyIR8qc8cq0S
	hiSzUOrOtxhTHjaC5tMvIDM=
X-Google-Smtp-Source: APXvYqzVTaWqmKRu952u3rO6DebqV6dyjAvuTXQei2EEtlbJBkMqdTtcKQyWpnWceQVQ0XwuSwb5hg==
X-Received: by 2002:adf:f10a:: with SMTP id r10mr10182231wro.202.1581770171703;
        Sat, 15 Feb 2020 04:36:11 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6a8f:: with SMTP id s15ls2968069wru.7.gmail; Sat, 15 Feb
 2020 04:36:11 -0800 (PST)
X-Received: by 2002:adf:dd0b:: with SMTP id a11mr10620335wrm.150.1581770171037;
        Sat, 15 Feb 2020 04:36:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581770171; cv=none;
        d=google.com; s=arc-20160816;
        b=Zn3ESKAJYNeLjzs2IFe96wAGNJdpvbPV8ackrohkJ86tpDOpbJccZIK8Ttrq30dedB
         LZ6T7QwqDlgOIA8IyAt9rI/KC4oVOZlncZsYv6wGTl41oOGs87MQQpiPQ/2r8S6P9aQ1
         l7sYz81H/4Zth5sT3Z4thEcsX9K/Ob8fJDUZ8sJygTpVx5KVGk+CgtGMLrzUC4Gc+m5I
         GymW7/lyVHef6ArmJs30Q1mUDmbtu7y5TfjAXcdx0G78kPjmYtpFvcrjGcTsW4zIkkIY
         HVhZFCEcYUQ7rTW/cCcgQBhM6dfxawEI0TXp4Fr9pNOfh8nlm2Fybb23Zsmub3dkBA1S
         M5Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=VzeO8iE92/k+GPT9pE86bmpPz78QxdGIr4XKetyNJnk=;
        b=khiGjgAIJYE+I3jCbLwkioc3JSMdmjlEJ4o31K6K3HufcWYQ91Do5TSqmXkOMqHBZt
         GVnfEBBGME2rkQr8nBKZyy71vVXVGUs7HKZuBm6je5HCb5weF8AlkA3JLwf/fbLjOVoE
         A8t5Xy2pq2EYvLiGqq1twBGcVyS1RlEGWmqWtlBZjej0Pu7Ltc42N0QcNirckx4PVEt9
         7pzMR8HyrWPMAkP72NIaLrdkol7rzw35ojlDhnBWyLyUoKymJVjLNwLcQc+cMReRqAvO
         +CoDmDCVjA3sy/+RoniKZujK04LjvWCFfQs4DzQ9I4P7vcRCu9ZT3/2DeYzyEn479DNL
         VQvg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=YUps01cz;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.4])
        by gmr-mx.google.com with ESMTPS id i15si513591wro.2.2020.02.15.04.36.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 15 Feb 2020 04:36:11 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) client-ip=212.227.15.4;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([95.157.55.156]) by smtp.web.de
 (mrweb002 [213.165.67.108]) with ESMTPSA (Nemesis) id
 0Lcxjk-1jklo22u3M-00iFZA for <jailhouse-dev@googlegroups.com>; Sat, 15 Feb
 2020 13:36:10 +0100
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 09/12] ci: Renovate hypervisor config
Date: Sat, 15 Feb 2020 13:36:01 +0100
Message-Id: <ca9863efd13be47d8be61ba7e2738feff370d73b.1581770164.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1581770164.git.jan.kiszka@web.de>
References: <cover.1581770164.git.jan.kiszka@web.de>
In-Reply-To: <cover.1581770164.git.jan.kiszka@web.de>
References: <cover.1581770164.git.jan.kiszka@web.de>
X-Provags-ID: V03:K1:p579lOzi7zlPNICzuy+ENXj1prc7/QdjC2k5TRBhIFavRudtBfu
 Nr8xlae3phRdGYmBpI47R2KuvbVg5Xmif5tMCPB9NPNoXz2jgvnuvbIjlIPw7HgEGYo0bst
 OnjBkW7A+gux+xvqL1txywJaHK+w82K4wZ0/V6gB7NLmx5VoIf7l9RO/INf3LtnDpkBwYVY
 dXmqbUdytoDBpcLWA+Fkw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:kcq+gFv4sL4=:elzBm5IlLSO9gLduqcPaSo
 sBoNOCP0gv7WTr8iTpFlQgzOLhFCFHtAN6Y08hTxqZaB96QYiF8rxfQwvADuwYkYPAHHzvNUR
 ICE4xVlwFVaT4XM+xj1/CEAbILZwdqZrG7+npejPrqwAZVI36ygvd1jAQKdtFjHSFEQmK/keb
 uZYWr824vvXv5Q7bIeYPJwTeDqwxYfhtGM8HKZWyNj74eO1EPrn+jOBG+mq/CGD1Jd1FiNZw9
 rwMWYKH1rHudjaYVjuoRj3A7Zi9bQIvZxvfNM2gk2NkreJzHxMHCzb7qzbeWQXP3GvTSqWX0b
 aAvrRgYa0J8xnncXSslSPwDkz0LR0NODd8n8gpErVFUGKnwzJ3p+/2xjjxeF6nmxnpsToWddd
 jKLyIBsOtJagZfx07fHnYSiB9PFIc9XZn7whDEj7AVmJ2zEk0SjoIA0bgMx4GSleV3x2UxDi4
 Q9vytI6KakSVxi0fvYoo7KCUgS06togn1jOUDvsZmsEsM75iAxZb3km92iNPUyM6/pnVr5laE
 +EIGZHPBveU88Av5Dd5722XuYLcYVzb5Dnh1LsX378ecEICqu0xF9/ZdcaE1HDLLxcWH6vUrz
 2ELIlbmwLxOIN5JopqdWTkQpYJrzM9pG+nU6PF97jYGtmN1zexfLXp9VovqLO7aw+xtBTUqNz
 z8wW/8jVuVitkUwErTigTy/3Wb1V+WvY1z474QgpZVUu9sdV0Hi1xRvVkOWfsGeiAfOtEYUbc
 JKzLZSdw9NWe8dwPUY7OwZsrcvnCcyLiQpTHyjMF8fFCDxNlQqbXCTU9fmy22oPMdBo3lxilf
 dlyE8bANlECrH+gUR9JsvnMqTB0hSRdT+9xpcyUOgO2jdwAtcqmCFVv+pHSTmRd6kioRaP6eX
 E490ZudP1thWr5moCMhOzCkrsu4DKWlwyDdjhAJWQ7SGN/ci82Q5hhnISWP/cQyO7jrbVidZL
 xHoFMeaakDqzInHBl4TJryh9RPeUvU+0DO1QQw9K5PJReOJvssm3WWKH+Dv/+VYNNzKMAyhYi
 l/9S/Xw5NbXsYISrqRxHrWtoObBFuCyZQfqBbQz2bfqrz+7Xm1KVnFeGg8PUDYWKOmh3IVQbr
 5L2ZsY8A7v/S8EFKp042y2p9N7+5aCgHHxmDvZX0U6LMZqs7la9YDXxcxksHRfSF6Yy7t3tEV
 C0jPN5y+7LqK07hBp2Zrc8mzhxZz2sI7pTDY1fZkzeTPQ2oRpB5RbdNCy6GjqTPpru/lk+sMy
 JloFcLtxuFEnbLTOu
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=YUps01cz;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de
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

Several options became obsolete, others should be tested. Add them all
into a generic jailhouse-config.h.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 ci/build-all-configs.sh           | 2 +-
 ci/jailhouse-config-amd-seattle.h | 2 --
 ci/jailhouse-config-banana-pi.h   | 1 -
 ci/jailhouse-config-x86.h         | 1 -
 ci/jailhouse-config.h             | 3 +++
 5 files changed, 4 insertions(+), 5 deletions(-)
 delete mode 100644 ci/jailhouse-config-amd-seattle.h
 delete mode 100644 ci/jailhouse-config-banana-pi.h
 delete mode 100644 ci/jailhouse-config-x86.h
 create mode 100644 ci/jailhouse-config.h

diff --git a/ci/build-all-configs.sh b/ci/build-all-configs.sh
index 32c8161f..81898fc1 100755
--- a/ci/build-all-configs.sh
+++ b/ci/build-all-configs.sh
@@ -30,7 +30,7 @@ for CONFIG in $CONFIGS; do
 	echo
 	echo "*** Building configuration $CONFIG ***"

-	cp ci/jailhouse-config-$CONFIG.h include/jailhouse/config.h
+	cp ci/jailhouse-config.h include/jailhouse/config.h

 	case $CONFIG in
 	x86)
diff --git a/ci/jailhouse-config-amd-seattle.h b/ci/jailhouse-config-amd-seattle.h
deleted file mode 100644
index 0510b942..00000000
--- a/ci/jailhouse-config-amd-seattle.h
+++ /dev/null
@@ -1,2 +0,0 @@
-#define CONFIG_TRACE_ERROR		1
-#define CONFIG_MACH_AMD_SEATTLE		1
diff --git a/ci/jailhouse-config-banana-pi.h b/ci/jailhouse-config-banana-pi.h
deleted file mode 100644
index 7e8a98d0..00000000
--- a/ci/jailhouse-config-banana-pi.h
+++ /dev/null
@@ -1 +0,0 @@
-#define CONFIG_MACH_BANANAPI		1
diff --git a/ci/jailhouse-config-x86.h b/ci/jailhouse-config-x86.h
deleted file mode 100644
index abac1b12..00000000
--- a/ci/jailhouse-config-x86.h
+++ /dev/null
@@ -1 +0,0 @@
-#define CONFIG_TRACE_ERROR		1
diff --git a/ci/jailhouse-config.h b/ci/jailhouse-config.h
new file mode 100644
index 00000000..a4562125
--- /dev/null
+++ b/ci/jailhouse-config.h
@@ -0,0 +1,3 @@
+#define CONFIG_TRACE_ERROR		1
+#define CONFIG_CRASH_CELL_ON_PANIC	1
+#define CONFIG_TEST_DEVICE		1
--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ca9863efd13be47d8be61ba7e2738feff370d73b.1581770164.git.jan.kiszka%40web.de.
