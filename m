Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRB5VZ6X3AKGQENI4MVMY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id 610B11F1006
	for <lists+jailhouse-dev@lfdr.de>; Sun,  7 Jun 2020 23:32:39 +0200 (CEST)
Received: by mail-lf1-x140.google.com with SMTP id w27sf5065533lfq.2
        for <lists+jailhouse-dev@lfdr.de>; Sun, 07 Jun 2020 14:32:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591565559; cv=pass;
        d=google.com; s=arc-20160816;
        b=CZr3usn0Ve02HYiG5ZSOy5KGcEGogPyDDBTEsJsEFmHznjWq26dzzgVdTM0kLqxQvv
         sSfiF904UyRWIE+CAn1SRkE7CDx32p9FPFooQBo2ZjWNv0cEZzh6x5lxbE+lGpXx4N8E
         nyH/bbABQ3rPM30q+zrV8R/kUn2txiJi4er4wfOyXP25S6hoLQt9Sz4www8Eecv1bIcy
         FBExsWe8r9D6zdzicGmlItNsCCuJ9QODb7YLXvuSPaLArwKnR6KwROPWOboWVD9cIuNd
         9QJa2opD2T+VCG86jhg/X3w9K4MNFLHZgSfE2qTrbvpJEvHcx3gT0XaRs6cDcnasT6lK
         34lQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=+4VaeOxGEfO3sQQ5U9p9utl9RujOG/m6UAI1eCrX3ys=;
        b=NcS4dKXf5KNwnBFN90klOz/LY/HAnOJzUC3UJbeW9LTZKIg4uIKiWvc2dK19EqQqPG
         HjXfCIwUlfhx+JHUhvyesr6HYTorjbyQG64Lz7DBoRI1W4NhSTwmMmFpAvmsTczjTt7e
         +f6rdw2KO0hd61wf4NnNh93r8Bbu+tuw5UDwAbRqQTdkTLrEzqlBHMY9OV22I1qeyPnW
         ninQwAg3Qki+9f6QsT7KW37/dY2v3oEXWnxhCnWzZAqKYcJNx2yDXDZ6obXtZbDqfSe5
         SVWCj18X2rGbHiuiJLREXbr7TuZKoKe+mmu4IVt5ARAtWOidCndLR0nGDgRrtxD6Ct7E
         8WSA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=BgDtRmjf;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+4VaeOxGEfO3sQQ5U9p9utl9RujOG/m6UAI1eCrX3ys=;
        b=PQtLlx52jYzdWhTm5EGhrqRTCmDzVvBEKlZds60g1bncOOcKRO+VTkXiT48K6pswx8
         eOoidv8eJ+vnJuCRjFwWJZeY5242AqWPqJZiwMs8wXvV8SN3ZxIFAwukTIdKUMp2n8hn
         az13xBTJCPZRqgsbgXa41pnCQfD2pV7oY2uVeR7/AaOc2RuI1S33m2BSh05BSv3FzgJd
         FlOk53pEYf1v6tpiafzm3x77pfEoLnXhABlbZCeumyMH5c3M03PsnbrYIbMJdAmYM/GL
         fiLL0Uuya4ZqxQLQgZDPMoaXiShV+WCvdtfNFAn5KlVgjiDuNxEx3vzCmO0DLwRZA2C4
         7bUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=+4VaeOxGEfO3sQQ5U9p9utl9RujOG/m6UAI1eCrX3ys=;
        b=tqciOR1iHWBAx61MC77a0bnWYaGvG4n+uvozCzDWJhfwlgqtAZLPRewAuVK53r/vkP
         0R37VVG/vzX/3P5bh9JYd/k8199N+7KCZ2hxnM8f1JXnmLKwMATIBUOXMKyqpIkhf8K3
         Kw0GKZKJh2emHFcOZyNA2l7U2TcIO02hnND1XdkZglgtFz/A0GCbxl4j9ERliXAPMzVP
         0tqG6+WUjteuyJ9z//pb2y26Zmx2QuqTQZJrukY2qVIgBAsCQHdnrx2LEH0KkuW/GRPz
         RWBaxCmePPq15KT42IzCqLYdYmjNad6jaY9ec4P99g5eP0L5i0+DP0Wi+HbeujV9yoah
         dAeg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531d2Tr+UONfN9d7nVuZ4uMKe4zVlJ1KKMqx+oVGeH1xPFkfswE5
	E7CUtg2Xnllz2LelMhNs8gk=
X-Google-Smtp-Source: ABdhPJyeO6RzI3iyEeWzeeDk046aN/c0RR1Ozz4StF+a7NcX5mOWUQNkW3zcG1JgN+Os5jGbMV5DHg==
X-Received: by 2002:a2e:9b4a:: with SMTP id o10mr9765814ljj.278.1591565558868;
        Sun, 07 Jun 2020 14:32:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:43bb:: with SMTP id t27ls1462778lfl.3.gmail; Sun, 07 Jun
 2020 14:32:38 -0700 (PDT)
X-Received: by 2002:a19:c8cb:: with SMTP id y194mr11276658lff.89.1591565558070;
        Sun, 07 Jun 2020 14:32:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591565558; cv=none;
        d=google.com; s=arc-20160816;
        b=ECvzYBAUnbHNVjjyqwlqWHTTMYjL4KQjxisR7a+sWu7AnEKFfM1OvwxICAwVVOIiSA
         1dd/kBJUnMnWNWpywJGWce5d9nExqxnCr4D4LKkX2Ge+kjRLt0eO8I88yo4Lz1893vtU
         g5LgopizYvDMQ4Nn9PJIcqqNqxwoMB6lnh5cTXYjYH9z2fpWDMJvDYfQCgLCxper8l0I
         9Mlb1vF8DZE9xJA7VUjFPaYShZ2eekxNlgWrfz5GtAUOknhN8SZJjHdzE99czPzYFZ9H
         VjNL2OgAN+OWYNpZU7cOw/knewjIgpeEPMAJCEdfgtgmiYREC5BJAZGAXHfmvU4BMrvf
         AIWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=OQ697hKeb6gdcaDqUwtPCdflSSxLaWtWBP73+bRg8qU=;
        b=V6s5p+66cNUZp+VWDlHzAooBS7une/9QXu6vlstrzfYgiNjdLMMPbEwzHM5WtfDO9k
         166Cc2HBH8ptnBLjxn/fn7nYdyF+u8hcqLNMcYVE9yQRDlMrlTz84qQWgLX+UKH9z8YS
         5OtmC4rb0Pzik6F0CtGMZutDkaPvpaqFxCvfDVLxSGlaNC3x1C1FNroTtHyMCQasnPKh
         HhggcCQ9kWTDOI+m4eoPL7Adtg01qzQVyP8aLqYbzMvhDG4WhPh+sY9DbAgzKmx3sLyc
         YIHD1z6jbp44PsBaUGk3aySn7slSh0iSVchADRBu2Qjk5PECg24PPGlkfJoR2qvx7Sc2
         pmUQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=BgDtRmjf;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id u23si416475ljg.7.2020.06.07.14.32.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 07 Jun 2020 14:32:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 49g8jw2kfYzy7F;
	Sun,  7 Jun 2020 23:32:36 +0200 (CEST)
Received: from omega.binary.kitchen (194.95.106.138) by
 E16S02.hs-regensburg.de (2001:638:a01:8013::92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Sun, 7 Jun 2020 23:32:36 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Jan Kiszka
	<jan.kiszka@web.de>
Subject: [PATCH] pyjailhouse: config_parser: simplify signature checks
Date: Sun, 7 Jun 2020 23:32:26 +0200
Message-ID: <20200607213226.861989-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=BgDtRmjf;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Just a slight simplification, no functional change.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 pyjailhouse/config_parser.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/pyjailhouse/config_parser.py b/pyjailhouse/config_parser.py
index ccb5aaac..6b9d9066 100644
--- a/pyjailhouse/config_parser.py
+++ b/pyjailhouse/config_parser.py
@@ -158,7 +158,7 @@ class CellConfig:
              self.cpu_reset_address) = \
                 struct.unpack_from(CellConfig._HEADER_FORMAT, self.data)
             if not root_cell:
-                if str(signature.decode()) != 'JHCELL':
+                if signature != b'JHCELL':
                     raise RuntimeError('Not a cell configuration')
                 if revision != _CONFIG_REVISION:
                     raise RuntimeError('Configuration file revision mismatch')
@@ -203,7 +203,7 @@ class SystemConfig:
              revision) = \
                 struct.unpack_from(SystemConfig._HEADER_FORMAT, self.data)
 
-            if str(signature.decode()) != 'JHSYST':
+            if signature != b'JHSYST':
                 raise RuntimeError('Not a root cell configuration')
             if revision != _CONFIG_REVISION:
                 raise RuntimeError('Configuration file revision mismatch')
-- 
2.27.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200607213226.861989-1-ralf.ramsauer%40oth-regensburg.de.
