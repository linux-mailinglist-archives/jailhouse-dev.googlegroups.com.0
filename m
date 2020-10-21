Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBHEXYH6AKGQEIM2XX2Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAB5294F2E
	for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 16:54:22 +0200 (CEST)
Received: by mail-lf1-x13c.google.com with SMTP id q25sf1300838lfn.4
        for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 07:54:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603292062; cv=pass;
        d=google.com; s=arc-20160816;
        b=zAiouhCgsjzp/wnTEzn+fi6Q0inK1W3YXkXI7BIlTNDsMQVuAfXdLiaUwskX53iCSd
         teg4KL2PNcTm/iC3w6AS4Vmb1avqKI9PtLs6qSTKswx/yVv5A2TpvZz4NUIkXSC5HMQW
         iKfv/OeukLzLblNK0VGenTndLU+yqxQ+EizPdiwZ18ab7W3Q9CEm3Y1EHoK/2w+zDcvt
         GscJkMq16a5O+sLH2irEONyyySS7PvuwV5OtOsbu4u1fwmpLmer5Yd6AYMGRh8ysKip8
         9n/H8v7WdBTQ+lU+3pQZeBBjS+jdiT0PUCR4KXNl3K88Yw8Decq2r/1WwDVQ4Ca1F0Xg
         2Oww==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=HylPSe58J/4jRi5Uhk3zOiMtBhW5ZIkjU5syZIoHhqk=;
        b=tvQz8Tnt+hTrdghDqsE6z0GfQ9/3XqKgjUmUytWLPfvxjtwnmC0EM274OJVDzkgXf2
         lRBBAjxgDkR/HHNLiYi2sR6tfvYWvTRkm2UposGH9HH/vRQnXM3wv7iUnjzXIjUOcB6Z
         u7Vlo+cmtpC3aSopnzwvqw47ZBrAUbKG4RiOisnk3qmBNlaPyjEFxZh0rAFAHz9sDKZb
         MXCjr0NWgzfuKsS/fwleElhJwY8KyViypznkpG9t4LeSiMIGrfS4r1I8r6Hgk1LYyb8K
         LJs3jBqp9l2Peoq2qDTwXzUbZCKK/y5Dq0G6l3gnQfpHfjAPJ+CHeVxRflpO9p/YsYlq
         Of/A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=1kAjD6bB;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=HylPSe58J/4jRi5Uhk3zOiMtBhW5ZIkjU5syZIoHhqk=;
        b=DWt5WJwqcdYgGbQLRZz9rwwo97WgXrXiy0fe84ak1yAJ9Ynp3F0MVGbQe8U+AQ7Swy
         mGv6RWNU9k1ddEaDbt2VDUOyu3Ke1ea6kl4AEii355tkf42b1P/tBmH1dcq10sf/xSL5
         SAoYehOPSPAF+JfADvZgTOhNnjWzDGV9i025hHyrZRlU060rmWDJMqnb2O+wmTrGZk8Q
         LVNu7GfO9NRgLUe3TgmsMJxpp8LoFkTzSVujcEYA/iF/JYquqkl43soKbGPfyv2XTgsn
         iS9lHpFgc2UuVrjof47awZkX1aDoMqlP56iCOKghLV+TPKTwRJ5RmuY6SgGx0ozMPzKO
         wcYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=HylPSe58J/4jRi5Uhk3zOiMtBhW5ZIkjU5syZIoHhqk=;
        b=AdZSGq0pXyQ0YinBgTIDIQVqdST86Pz32Y6nDh8A8GKw5MSjiVf76LuOSN8ZfCid/Z
         sXzRT1BdRxwJJUU4M1beB+1Mu6DVvjoiZ+wqlem4ixkMILCuN0ArlN3BU/9Y2eDWEw9b
         nWEp2bucxzr0IfJVYmPDlOL5R0lGmQpzR/dGaqi18PAYdvceILHpRl4uUwS54f041Wjg
         7CDL/J9IBcQWYDbZXZgG+fIVyguBp+HQ9mZA/0kVUrrjt6jKuc42ghBbwaCjPkYoaMqa
         UuHd8oKceON6xGp57EtEywVIbg7KDk3GazkR9qiche5tiq15eu/VCN0KaLpxb8FFo+21
         1ToQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532o3+NRKwaaJY3ZGF9MDz7SOlXp8R3rKowQnwgfeqbYLkqoL2VI
	7OzGjz+yfkbVRoMKxl2/c/U=
X-Google-Smtp-Source: ABdhPJyFKTdpn680dvbCCjl2CWrlIR06HCS/EtRK5PXdwjSLMwdDJjkaPv0HT+MC2ramCYRx2vi7Ag==
X-Received: by 2002:a2e:978a:: with SMTP id y10mr917704lji.27.1603292060835;
        Wed, 21 Oct 2020 07:54:20 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:890b:: with SMTP id d11ls1079900lji.6.gmail; Wed, 21 Oct
 2020 07:54:18 -0700 (PDT)
X-Received: by 2002:a2e:9803:: with SMTP id a3mr1695335ljj.83.1603292058246;
        Wed, 21 Oct 2020 07:54:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603292058; cv=none;
        d=google.com; s=arc-20160816;
        b=Lh2FNMtTBIV7W4pyzIaHdk+BZnXn9aJtGo806/N35dmsWwBlfoBluGBWkh67NgGArq
         UokDzNWbqzWonhAlhSKzPobRb0yIUKcaAt66WoP/TSHo1UUvrz/0Zdjk0InON9vtp6CX
         0AmdIA7bNGgE0J3gzk0sUR7cPPLR4oRQq2PFpMO0nVgeq9vNrlWOx/ILlYzLSGW0+8UN
         aj0qck6Gtd6jrRJEjLNp1xfdAFLEUCx1ia7iukjNDp3tqC9Zk/q36AFLVNFCoYw0vA0I
         mEljDJcd2U/08eaY1BhoxiMS/srVTFA1UqF2/vUmlBpkvvUyTScIwL9kHxRXy5k4XdrS
         J7vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=G0z/M5A7xJN67k0ZeLQctprfMAcIfyYKCpQ0WSeTEs0=;
        b=TmzcRAgWLU8QUFwEQPMex/nLmEdtkHdof+oBAs3UxDg2JGiJzC4dT0S/B0Rl9Mwn/7
         tR573jSyldRcRcw6Ft/S2Yw97ujpJcGTIH4ZTtrBB84325KOvS35KM05tv8S9knVveUT
         Rby93OXJ6P9U6pnB83+rnAh6MJYkL2yQhejq1Rq8QOreWGLN7zD1K0dnL7hZcSQxaRXX
         2DGqJnVPDqwZoPrYfEOPDyg2uymIdHgiuISdk6Xu3iiTZHWJWnvnMy5grpm/sskbWABj
         K+nldSQK1qqtgIEqc1Zkatxt4IMl08WhGAKMcr2JPjFOLbaJUdlI5U3Rd+O8gEIdewff
         OgFQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=1kAjD6bB;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [129.187.255.138])
        by gmr-mx.google.com with ESMTPS id n5si56516lji.5.2020.10.21.07.54.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Oct 2020 07:54:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) client-ip=129.187.255.138;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CGYRX5RqszyVy
	for <jailhouse-dev@googlegroups.com>; Wed, 21 Oct 2020 16:54:16 +0200 (CEST)
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
	with LMTP id LNTEQHszeAfb for <jailhouse-dev@googlegroups.com>;
	Wed, 21 Oct 2020 16:54:16 +0200 (CEST)
Received: from kabal.tum.de (unknown [IPv6:2001:4ca0:2fff:11::2aa])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CGYRX2knKzySK
	for <jailhouse-dev@googlegroups.com>; Wed, 21 Oct 2020 16:54:16 +0200 (CEST)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 11/26] hypervisor: printk: Fix Wsign-compare by casting width to int. Fix protoype for align.
Date: Wed, 21 Oct 2020 16:53:49 +0200
Message-Id: <20201021145404.100463-12-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201021145404.100463-1-andrea.bastoni@tum.de>
References: <20201021145404.100463-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=1kAjD6bB;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as
 permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
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

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/printk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hypervisor/printk.c b/hypervisor/printk.c
index 64207591..6f149f0f 100644
--- a/hypervisor/printk.c
+++ b/hypervisor/printk.c
@@ -133,11 +133,11 @@ static char *hex2str(unsigned long long value, char *buf,
 	return buf;
 }
 
-static char *align(char *p1, char *p0, unsigned long width, char fill)
+static char *align(char *p1, char *p0, unsigned int width, char fill)
 {
 	unsigned int n;
 
-	if (p1 - p0 >= width)
+	if ((p1 - p0) >= (int)width)
 		return p1;
 
 	for (n = 1; p1 - n >= p0; n++)
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201021145404.100463-12-andrea.bastoni%40tum.de.
