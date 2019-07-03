Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBA7P6PUAKGQEQLRIDYQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x540.google.com (mail-ed1-x540.google.com [IPv6:2a00:1450:4864:20::540])
	by mail.lfdr.de (Postfix) with ESMTPS id 6304B5EBCE
	for <lists+jailhouse-dev@lfdr.de>; Wed,  3 Jul 2019 20:44:19 +0200 (CEST)
Received: by mail-ed1-x540.google.com with SMTP id b3sf2262101edd.22
        for <lists+jailhouse-dev@lfdr.de>; Wed, 03 Jul 2019 11:44:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562179459; cv=pass;
        d=google.com; s=arc-20160816;
        b=wt06ttL3KEGRxBL1tEi9T5C2v3hPuU9fm+pOABj9c5CL2gqQzBfWchnkT82G6u2Efk
         IWjoTG5NdTIPE+y9NGHk/lR7M6R1y/tNEmEz0hHEwwTOlwywBxZzY9RzTFDPZ1hDR0r5
         2WMCWvECmwxOh3EyiElpd5/U0O6YBaxWKxCfySjLjq/ZyRk8PHDBZDmQSaosCcc4flxB
         SziIxnMcJGhnoDzuwGTunMHWQi4hDArDRe+mre1WTMq4i2crtw3gekcWwmiK8eAyh1RR
         JHHd0FojshfLb86QEQtzd6PbzmUg9ypep8PcXH6KnH11AX+QOQgsrV/GF8ywpmlM3p/u
         xonQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=vwAXUUJMZi9jo7z4PowdeePA5kELy5TMsHXwu8tYTk8=;
        b=Brb+AjpsKKbl2s8bX3oHsW6QBhwwcVUuCIjfQYcPBWUFc5z3k/hiLgMp5Fdi1oo7EA
         5xfi9fzoUdYUqttNfVwstS8VQPGtCG06QLnlB6OHb7NRk0PUKcBkmIoH/NAdUGwJ849S
         dO4B+vflA7xW/uxF27IwesRd8gN4PwW4yFt0RItfLf4CDbnC182qpEj6EMzni9tJsutk
         6XRZd1cFe07I5jYgxjEEr3iHrKaX0swRNeZ9AcsPTXff9Gehs+7oFyIyaDtY7vH0+LQv
         w/2VVJdZzK3kLpgQI2tCHx8XJs7fURF8N1bFepA0W5mwKuKiToqLWQJ/PlhFxngnbZHd
         c5Xw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=vwAXUUJMZi9jo7z4PowdeePA5kELy5TMsHXwu8tYTk8=;
        b=EPj6ilnS1dN/gViuf4nWNh0lVMzPz8Pfv+m6mnL280IA7GTwt7SUnrq4jgVBl/T1N4
         3Jy8OmvG7QD13wlZweNA1MNGG0kS6yfflQpdzcDjSZ9rAQTfIM713jBfKLDiKAwoSa8f
         m0iIHSVOJD6rhmt8DXUdg5kFNyB0WST0zt78f3Kb17pnxHXucnm09c3y1gJ9xQPJsYMQ
         PIPowW7QXXiyRkkYl+o7Q/rgZ8Ulm0Exwr45VXynB5sFXCG2q2rz2ltFwnCebJmsCAaW
         IVvmAD1vSi4xMPy0IxvSUIJ+Zhk3qt8Mj2PUA90LkpaJUxG+Aqu8tD42fslORFjQOX/K
         QPgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=vwAXUUJMZi9jo7z4PowdeePA5kELy5TMsHXwu8tYTk8=;
        b=M3TQXm80XdpQd77tZGMRI5baD+bDpnYItqo5d26bgB19Y61+e9pvt7SsdCtHVVPezA
         KDFQQrowy69dPk+bz8/zT+Pq26Vee/+W8zeEUxcj2neWvBPN9r9SDCF6qRtLFqFJz+Yq
         eaw8BOCzyotG6wxjU9thy5q6u2DDLX7uMAE13z/dMbs/hVFiB2a0RD+K1YdNB+QLxOyQ
         HdMCdkKDwIaBn5+dQggSqwklIc97xfifyLZfRgiXf23WcG/XkEi3+Ab8MDUCf+6A3lCd
         H7n+yjS2BJpfq5Zs/E8SgR5kInnXTR4FpxQNiSaQDYdKtJbw7ESiJpEVfB1NhSA2l9UL
         CNhA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVu76jNXmrEB3KjaamkUc8up0Kaup8zPQxFS+rXG9McEjc4BNsi
	wEtMUaBw7m7s7UAlVnMt8Iw=
X-Google-Smtp-Source: APXvYqy2MVIz4eHg8eJK9nhaByz38dPzSnbnnklgLCs1BKvTx4kykP6gt6hbvF30QRBr2Lrfg4BIUQ==
X-Received: by 2002:a17:906:6413:: with SMTP id d19mr36141298ejm.147.1562179459205;
        Wed, 03 Jul 2019 11:44:19 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:95a:: with SMTP id j26ls805538ejd.14.gmail; Wed, 03
 Jul 2019 11:44:18 -0700 (PDT)
X-Received: by 2002:a17:906:44e:: with SMTP id e14mr27030319eja.119.1562179458616;
        Wed, 03 Jul 2019 11:44:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562179458; cv=none;
        d=google.com; s=arc-20160816;
        b=QbTiF6kPH/N9fBKwNbrkKwxuaNSjn+kXskimQItPPOZbQMB7oYVV7bRueRb+oZAGRb
         ChUcx9I3vc5aLqJA2t12ALrXC+OUgKPJ3yWgiSjEnyUwKV7s0AuB800XrrIyWLH8bVSr
         Pi7SYw2pNwuY/lDyFagdZQTL0lou/WrZkZHisGr3Sor7tKt0itVSXmKwDe74HRgx6OrG
         qfqzXBRyKgK0C866Wvqpn60BBN0lIwpiNd7qLPS5Z5wiXHtZir5MKXLUGxS93GjRqJh4
         BhK6Nerg3DUQNfN6aE/OoYpNG9x5N48KwA/IfegRZw7H3uxP+1LSQNUmP+Yjii3bfmuJ
         Nz8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=Q8hF86Ja+vLDJm5E2CO3w8CZn81WPHHL+F1OOHzblPQ=;
        b=LhpQ4C6gJf7v76yqxiYltnMCMEz39eZqMGHAfbu5fYivPTl6liA2JjDSFTtRjy8RCq
         pejIUMtXZ0on/fHMZomoj38L78ntt/Yza1v1Yl3BdFdloUzVtXHp7GLn8PNSd9kPsXSS
         WArnyNvq8FtG5AdjbsLbTf34vBNGiE3iTdSfXPxy/dpHF5AizSGbd+HadeHDakKvW7oh
         JUOr5n8xIr+mbS/HZTYqMhPrTP+dA+/b1rkV0dct3HSfOGxDTvmdOu2+kj9QJdsuN25P
         I3CRlE2NcXoHfaQKhkokvjKZ2FJ1pEDHurcH9g7EgDVyMwW4U6AvkfG5yZxqdC5RZdO5
         D9wA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id jz14si165934ejb.0.2019.07.03.11.44.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jul 2019 11:44:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x63IiIcp005677
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 3 Jul 2019 20:44:18 +0200
Received: from md1f2u6c.ad001.siemens.net (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x63IiHF8023455
	for <jailhouse-dev@googlegroups.com>; Wed, 3 Jul 2019 20:44:18 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 1/4] driver: Fix memory leak on errors
Date: Wed,  3 Jul 2019 20:44:13 +0200
Message-Id: <1b480b7c2eae1bd1b898e0df379c3fef1edd4337.1562179456.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1562179456.git.jan.kiszka@siemens.com>
References: <cover.1562179456.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1562179456.git.jan.kiszka@siemens.com>
References: <cover.1562179456.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

When some of_changeset_add/update_property fails, the property needs to
be freed. Do this unconditionally in the common error path, just
ensuring that prop is always initialized and, when consumed, set to
NULL or the next value. The latter is already the case, we only need to
NULL prop after the finaly of_changeset_update_property.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 driver/pci.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/driver/pci.c b/driver/pci.c
index f4fee561..bc02629d 100644
--- a/driver/pci.c
+++ b/driver/pci.c
@@ -254,6 +254,9 @@ static struct device_node *overlay;
 
 static void free_prop(struct property *prop)
 {
+	if (!prop)
+		return;
+
 	kfree(prop->name);
 	kfree(prop->value);
 	kfree(prop);
@@ -421,13 +424,17 @@ static bool create_vpci_of_overlay(struct jailhouse_system *config)
 	strcpy(prop->value, "ok");
 
 	if (of_changeset_update_property(&overlay_changeset, vpci_node,
-					 prop) < 0 ||
-	    of_changeset_apply(&overlay_changeset) < 0)
+					 prop) < 0)
+		goto out;
+	prop = NULL;
+
+	if (of_changeset_apply(&overlay_changeset) < 0)
 		goto out;
 
 	overlay_applied = true;
 
 out:
+	free_prop(prop);
 	of_node_put(vpci_node);
 	if (!overlay_applied) {
 		struct of_changeset_entry *ce;
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1b480b7c2eae1bd1b898e0df379c3fef1edd4337.1562179456.git.jan.kiszka%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
