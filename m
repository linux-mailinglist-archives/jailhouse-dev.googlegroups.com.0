Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBQN4476AKGQEOE3PABI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33b.google.com (mail-wm1-x33b.google.com [IPv6:2a00:1450:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4F729D24C
	for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 22:10:26 +0100 (CET)
Received: by mail-wm1-x33b.google.com with SMTP id b68sf151150wme.5
        for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 14:10:26 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603919426; cv=pass;
        d=google.com; s=arc-20160816;
        b=Qd1FNBTuDS9XbnoJr8JdUHoycvpwEkC1d3jC8PVl5gcQV60b6vVUG7ymMv6hTSKohI
         KIuDNdYjBFfq2Sj2U9p2mxrTnhA3qxt8qUn417vtHENUrqszeJ7VXkuW420EWzROvP4/
         mKl+Po66xVj9vnoLngDZf9N2ncvS52K9laXU8r30dMBys/SiAjQdTJJN+oRFnT4Uch7Y
         JcnrEj0S5ElpYaCp53oIBUbv8Rpg/W1Tl1pYMas4d2tKaWRwUVApDCw5/+AOCayYVxoN
         yUjVheOas/XsRxa5jXlCh7yG1fX+FhAUmFQCq6rvmnrh/3TacqjQie2IKHla4XIZzDuv
         R/Uw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=P+Jam1TK2WEdQkTjuYOzJrJ+R/uYP/i3ZuTYebm6PZc=;
        b=E2zCzu5GTPYzFwyF94n6MDQzPfVnvwxfW7M85+Xo8D4OBU0DfxCM0EekyHrJevRfiW
         8IuXainkM7QGDfYkvbKICqkVnpJEcyBFj+NCxQca/xnOu+j6uAdUrDpB1kC8Bugfa7ty
         22DbmgfAYs/xabqzV62boqbOguAEMcw8p3PmhA7I0PanEaF90LpRpaXfuhZd8E75kQx/
         icWcw/Wr95uTsMmMWOEIrrK95e8MdNwI87Iw9aA10aqDA0LJtv/6Cx4Q5hNN5DuwunKV
         fYmcRcSzRGFDDrvKOnLqYFsNBk6xMifxWt3cU5L6pPnrHDmaRqdyBxOR6KdEBM8FbY+f
         T0Vg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=zwuXxAMc;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=P+Jam1TK2WEdQkTjuYOzJrJ+R/uYP/i3ZuTYebm6PZc=;
        b=fF7RI07wAxTsmIxrnxGl6in3omkf3qXeZI4LLvezsdQz5EySAsShRrCOV4qkH+QRoa
         4Q8eJeIgNpbOF2JLh30DnJVh7hsTvY/aRAPjYCQzCDJEZREjsklELabjug88Hf2sdopv
         0ok+/GK7U7vqYLy5NRjv3RQ4XbzhNgpz0HZNriYga7+9ew8tcWRqFJkdxfCxI/kn5JXO
         DFK8uhGLPDgwY9v8SJFtNFe/M8D9B5Q9TZ8Z+4GWW87uB2P8H/qBl0x07l59/zsvfvyn
         QeR3mQehk3zqzS9TVD6q+axTlNaSl4nMHk500HGLUrdMNbZrsBGSFbzuTLcyLDBYEbsv
         P6Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=P+Jam1TK2WEdQkTjuYOzJrJ+R/uYP/i3ZuTYebm6PZc=;
        b=SJZBlbk/Q6BfqvQcA7uQMctKLovZLn5a6H0uV4qIwZLpWBPsINIXFufOsEz9CaqxEJ
         bDH+hCd+wXLODpRjWEOg799SE0//AjIK+Yimpij4B7Vaf2p8/c/4DmTAdv7zbVJJ5I7t
         xtFDbyBBIIAZWwRsPUH4m6FhnwValx2sgyKHpoqXXernLJBSGZMyaunht+csJKgPBZbX
         JbTLQFU+XvNFwpHMThPZAPpk53CurtbgNhR/LGg2I/Zt30br0cP5KNTArhNoibYhavA5
         R9uy72tybdK2b1w9inQWwjomdATWGkf6gX1ABNMTv3Ul/evYnkBT+DVJRXdqYxmNyeV9
         Al9Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532KEFx8JFM6xzTZv7CWpqKW3XcTRKNiQmpLa7kGnhPtvbZaMNQx
	o4wI9bnA9IW5jT4r13Pgtpw=
X-Google-Smtp-Source: ABdhPJwA0iEtk1DOLzlxgf34UcvjpfbcNOFu8E/prNA+9KMOoxk19Kzq8FHb2lCJwMQc4YYw7SAkOg==
X-Received: by 2002:a7b:c451:: with SMTP id l17mr753216wmi.127.1603919426292;
        Wed, 28 Oct 2020 14:10:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:cd12:: with SMTP id f18ls203583wmj.3.canary-gmail; Wed,
 28 Oct 2020 14:10:25 -0700 (PDT)
X-Received: by 2002:a1c:b041:: with SMTP id z62mr749264wme.183.1603919425463;
        Wed, 28 Oct 2020 14:10:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603919425; cv=none;
        d=google.com; s=arc-20160816;
        b=ssHKL6TU1+nLjitS/uM7dN1tjfnpJIxBJm9Pd95imDIdAJmoroA+MItYirEquzw6a4
         /KRAkmESVZzNxYpdG9h1VJuFef/fZfEsrfAHETgvzH/+AILrS4h9Rt9dbmCX7lpobh8Q
         X7/68UEMC7ZK7ZxWkn6f0vT3dSxg3FTTqCUWSK+V/8T+3DUTh02ROdipy+/aIwDbTMk0
         djs1YtrGMkyWkH7mteEGAXYonD0iWlorb1PmiizkeqEEBzDOKAduqbkBttKMZgAiGZch
         QwOR8MLcqiY5WlYIs1og9So1dnlr2dbnUbH1S7YdI865BH7mRziPY73nZNSgWy2cmge/
         sXWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=lVekA4a77ClFUF0Cwt12372B/w2tTFv+wexbfSG+dOA=;
        b=y0uEbvT1TsTaxweBHZo9Qezoy5pwL39lhW03tfcUVxerPX3ty+0waOvEkp+AKq9GvJ
         pmAvU91jt2ErTWz6RS7M7xPfkkN0RSR70V4IU0qwVg+n3ihwAFQWDy/FhgCbUVd4m3Nu
         NpUyMWka0cZhCzsvbfWJsV8pfXPLLrDDn4icFBsFlPtpGyED72OMrL7hZE0uAPCPPicE
         7YLhsrFwXJFPt8EEMOP2D5HOLnwxmf6k4cRSbnp1m0jj95wI9y3kS5h78EkFhz2r3GiX
         NMYbroxAn6/kPdtSaX5VWDw9z3J5Ez2G12bRS3XsoW/ZpzXRiBZPBl98VqNhr3vft/9y
         hGxg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=zwuXxAMc;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id 144si22370wmb.0.2020.10.28.14.10.25
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Oct 2020 14:10:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CM1SK1lglzyWn
	for <jailhouse-dev@googlegroups.com>; Wed, 28 Oct 2020 22:10:25 +0100 (CET)
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
	with LMTP id yyFbwl7EVI75 for <jailhouse-dev@googlegroups.com>;
	Wed, 28 Oct 2020 22:10:25 +0100 (CET)
Received: from kabal.lan (ip5f5ac6d0.dynamic.kabel-deutschland.de [95.90.198.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CM1Rt39tfzyWq
	for <jailhouse-dev@googlegroups.com>; Wed, 28 Oct 2020 22:10:02 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v3 22/22] hypervisor: Makefile: remove Wno-error from CFLAGS
Date: Wed, 28 Oct 2020 22:09:33 +0100
Message-Id: <20201028210933.138379-23-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201028210933.138379-1-andrea.bastoni@tum.de>
References: <20201028210933.138379-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=zwuXxAMc;       spf=pass
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

Re-enable Werror for all the warnings that have been fixed.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/Makefile | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/hypervisor/Makefile b/hypervisor/Makefile
index 54c16c0e..3807e608 100644
--- a/hypervisor/Makefile
+++ b/hypervisor/Makefile
@@ -27,14 +27,9 @@ LINUXINCLUDE := -I$(src)/arch/$(SRCARCH)/include \
 		-I$(src)/../include
 KBUILD_AFLAGS := -D__ASSEMBLY__ -fno-PIE
 KBUILD_CFLAGS := -g -Os -Werror -Wall -Wextra -Wno-unused-parameter \
-		 -Wno-error=sign-compare \
-		 -Wno-error=old-style-declaration \
-		 -Wno-error=builtin-declaration-mismatch \
 		 -Wstrict-prototypes -Wtype-limits \
 		 -Wmissing-declarations -Wmissing-prototypes \
-		 -Wnested-externs -Wno-error=nested-externs \
-		 -Wshadow -Wno-error=shadow \
-		 -Wredundant-decls -Wno-error=redundant-decls \
+		 -Wnested-externs -Wshadow -Wredundant-decls \
 		 -Wundef -Wdeprecated \
 		 -fno-strict-aliasing -fno-pic -fno-common \
 		 -fno-stack-protector -fno-builtin-ffsl \
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201028210933.138379-23-andrea.bastoni%40tum.de.
