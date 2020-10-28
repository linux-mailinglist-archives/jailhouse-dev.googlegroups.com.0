Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBH54476AKGQEGSZ5M3Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE7529D23F
	for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 22:09:51 +0100 (CET)
Received: by mail-lf1-x139.google.com with SMTP id j1sf76357lfg.2
        for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 14:09:51 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603919391; cv=pass;
        d=google.com; s=arc-20160816;
        b=N7ALlnhrRQaNm9mrp1lmNYgdeX6FF75DOjr+NsprLYzelaGSmGuAsFHkjJJFVaCSQQ
         ab2n6ee0RfC3UcyCzuspeApZtk/5CGSMVZt8GoyiP61mf2IXYDxxCrvRxT+H7uMoobb+
         6BBhQzTC5BTsZdK67JsEUuaVl7bifkAsWk1bkYjuHV2VK5ZC63VI/8z5RzJuIibhdzKi
         AhzqjO+D2jbnxWXAPnwvXeM7R6rEa090cjZDQF/EZO+zfMRp7jmdALTe2DbZIK+GtQWK
         on/hrM6P/8caWn3GcSLnSsmLBB5uH+Oc9QLbPKl+4Ug1ZwVpZpQ0k6TfDVv0nugAIrD5
         2Y2A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=fheHTq0z9H8yl22Rb5FQ67di/cauqcw7YjEmOmZorvQ=;
        b=YIwmdzmLQgOqHE48DaonVJftRAER88Cw6Whwlq+wi94+7sQFOF6GSdx4eIyH4C1LPW
         9jpD+wn0DVt8vC4XoPmhs+feE2WEifwAhH8mYwjsB77sMpSOVXP8kNEUO1jeDGGYgGF+
         F/T9phCQ1UIub5a56zPgQRcK7TW5kQPYlw9Cu9zfz0CcQRndAfOlti6ywJ7csCVouWSx
         bYxrJFSQKiS1N09Xq+xhaLEOTQMZdPqKVZrWAEWlfqEJEgUwGYCI0fWZixJ2rE4T+JI3
         GAGfzK5Fct+4pVA3n5whBSK6GgcnlCjejb6e8byLuXUAgGNlW75xVtHQ9jmANbaPNz7N
         44+A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=if5A3dQR;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=fheHTq0z9H8yl22Rb5FQ67di/cauqcw7YjEmOmZorvQ=;
        b=RO/kYFkTwjqLq0kYbdvX3fFI7u7MGir0P3PQoEXKZh0ev3Jgq29W3tQcPqqvtO80zX
         27Sy3XZVAOOl1ZnrSXaAx3vJO+zNsCG/gW5GaoG/jUAFslJeaWH+NvxVZ8VVIRFx90aC
         IA89rHfYkx7qP+QUvOHljAEnVihdOm+AANsmn+TJkS0+27IbfMf2xlPExDMW2orldhXE
         lmew0xRDriLuJwfghyTD/shehG9S9Gd36spNsNyQ3jldiM5l64fVRZRQJywQU15J1apA
         oGG/lRkrc/Fo+2HvRg2GifkXCgCuuKfRdaWbK5vIGnYLs7CR8RU0BroYtV7TeJs3B33e
         xnXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=fheHTq0z9H8yl22Rb5FQ67di/cauqcw7YjEmOmZorvQ=;
        b=tq74U7AgJa7CoBCc3tmMbBkVu63FnHd7xvyaKy3oIBV5vmkbvebLzxvuwZGE6QoH9X
         t4dn2rkYhs2yKTemm85p1QGQzK/m+rpi646apLtsZuoL1Nt7YBimPhy3mexTzfOwa0Ft
         67gk5ibcFDoqZODqpruAKewRMo84fRweyshg1XhjOZlf8I7OXBM1bsxr+Na7geXqFM9E
         651zphZokQUKKwhAhC3KH6IZD6goF/qIWAEd6h1DFb+zYjtz1VD8uMvf1ThxYyr9ROF5
         7VWr/JFR3C7JQqHq5Efvh61IwoOWSSqnGlYNekqKkeytHmUtkZWmLbQ5w54RfSAExBmf
         FiMw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533qGqATxe7koH0/r/08K8arAMkb2okZxkcIuo3XSK0F4NyQio94
	jncjMz7aTdHAfnS7S9tRExY=
X-Google-Smtp-Source: ABdhPJzr5pmg2d20uUZFJ8oMVmfx1ze2MKrf31g7LzviinPm9JB/ABNB8mSfJH6+0lGl+4JX6mM7bQ==
X-Received: by 2002:a2e:8986:: with SMTP id c6mr465327lji.29.1603919391486;
        Wed, 28 Oct 2020 14:09:51 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:84c1:: with SMTP id g184ls265451lfd.3.gmail; Wed, 28 Oct
 2020 14:09:50 -0700 (PDT)
X-Received: by 2002:ac2:5b52:: with SMTP id i18mr381839lfp.227.1603919390195;
        Wed, 28 Oct 2020 14:09:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603919390; cv=none;
        d=google.com; s=arc-20160816;
        b=rdgx7PJYKpKG34aNLqXklU+XWrgLrrREJUwpDSWb7CJ/Eq0sEuraUxG/8OJqtgQwGt
         ZN48p3cEpvUXQjJhsCaMyvDbVQEenpmaKpzfLnDJbLlkEPthi25dW6v4bIMBdcYi5Lfk
         XxpY8oqEMITZXiwFHcF0wJDySUpHm/5iAui9lZOkNF/r6V+HA4NQxbufK4GUk5xAmVbr
         FHnNBz4tz6sm6pEUesNuT2x8++YooLrGfgWi1vEUqiGQfK54Cv8thNk6zuEhGdt5wlLd
         IzBQ7IjakFDhOwyoVNcp5uzCCWzYWyDtwrSJQccZFKDWcjhXFnZnHTqxNISqnoSZD1Ej
         cy0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=j0cfjTqN494OlBLaG2oHR0cRpXAJp5JvWMH7LJDE510=;
        b=z3YqYaalb+ACYoAVu19ShkPiAhStCdfsYlZBMxppf5tpymt9bvQLzhrHmvftJ2rFAR
         PIXeckw/cHZLOaHzX644UGfHPsXXudShfhfgE1JLex0OGd5T+SBCRTnp5O0xeH9uNiJv
         Fg+xLGFBH1bHv/KPsTSQp5tw2BIbhEhtmoG/6dIgYw4h7g0PIY8zfYdC8o+H3+XHawd5
         2sNXPyOjMqUPV/k1cse+db2Z2vFlsxO/uJEtQJUuhyw2OFhYPbX4d2gusQ/dnipwPMjF
         1qCA7fx5m/kWkK8denG+x+Ic7PhAdv17jTFYwGNNu0z0saa+Auw34qPv7vNXuxT0g5mv
         zW7A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=if5A3dQR;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id e15si14296lfq.1.2020.10.28.14.09.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Oct 2020 14:09:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CM1Rd50GhzyWr
	for <jailhouse-dev@googlegroups.com>; Wed, 28 Oct 2020 22:09:49 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.877
X-Spam-Level: 
X-Spam-Status: No, score=-2.877 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_DMARC_FAIL=0.001, LRZ_DMARC_FAIL_NONE=0.001,
	LRZ_DMARC_POLICY=0.001, LRZ_DMARC_TUM_FAIL=0.001,
	LRZ_DMARC_TUM_REJECT=3.5, LRZ_DMARC_TUM_REJECT_PO=-3.5,
	LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001, LRZ_ENVFROM_FROM_MATCH=0.001,
	LRZ_ENVFROM_TUM_S=0.001, LRZ_FROM_HAS_A=0.001,
	LRZ_FROM_HAS_AAAA=0.001, LRZ_FROM_HAS_MDOM=0.001,
	LRZ_FROM_HAS_MX=0.001, LRZ_FROM_HOSTED_DOMAIN=0.001,
	LRZ_FROM_NAME_IN_ADDR=0.001, LRZ_FROM_PHRASE=0.001,
	LRZ_FROM_PRE_SUR=0.001, LRZ_FROM_PRE_SUR_PHRASE=0.001,
	LRZ_FROM_TUM_S=0.001, LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001,
	LRZ_TO_SHORT=0.001] autolearn=no autolearn_force=no
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id oFmZNv2P6l6g for <jailhouse-dev@googlegroups.com>;
	Wed, 28 Oct 2020 22:09:49 +0100 (CET)
Received: from kabal.lan (ip5f5ac6d0.dynamic.kabel-deutschland.de [95.90.198.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CM1Rd299VzyWR
	for <jailhouse-dev@googlegroups.com>; Wed, 28 Oct 2020 22:09:49 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v3 07/22] hypervisor: Wsign-compare: force the "right" promotion direction
Date: Wed, 28 Oct 2020 22:09:18 +0100
Message-Id: <20201028210933.138379-8-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201028210933.138379-1-andrea.bastoni@tum.de>
References: <20201028210933.138379-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=if5A3dQR;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a
 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=tum.de
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

Only part of the problem, Wconversion would complain as well.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/pci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hypervisor/pci.c b/hypervisor/pci.c
index 9274a0b1..6bf5e254 100644
--- a/hypervisor/pci.c
+++ b/hypervisor/pci.c
@@ -24,7 +24,8 @@
 
 #define for_each_configured_pci_device(dev, cell)			\
 	for ((dev) = (cell)->pci_devices;				\
-	     (dev) - (cell)->pci_devices < (cell)->config->num_pci_devices; \
+	     ((dev) - (cell)->pci_devices) < 				\
+				(int)((cell)->config->num_pci_devices); \
 	     (dev)++)
 
 #define for_each_pci_cap(cap, dev, counter)				\
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201028210933.138379-8-andrea.bastoni%40tum.de.
