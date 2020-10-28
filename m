Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBH54476AKGQEGSZ5M3Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33d.google.com (mail-wm1-x33d.google.com [IPv6:2a00:1450:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD2529D23E
	for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 22:09:51 +0100 (CET)
Received: by mail-wm1-x33d.google.com with SMTP id 22sf311396wmo.3
        for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 14:09:51 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603919391; cv=pass;
        d=google.com; s=arc-20160816;
        b=WTF1Ipsm/StvS3HR3VWFZXN1EfQcZhsW3twkBg4w7ViUbV0xbp6xuzegMjFC+3Ut94
         Jy1xiwIv92lAkfDODx/Y8cr/QYyDwbY44oHHoGKoEFQMm4DJDlTr3VJUO1rFBain/+yA
         i8/7YdGoFC2a+el6nP0XTjHtzKzAr/iRJHu0H78E+2b04aDMmktknBnGJ+AsiW0+Ickx
         jSvXd6qY6zpJgBH38SIwBcEdaKmBxSjXVALd7P402UGqRluXbzcTrQ6ZQzH1cUB2tN/2
         3RemPVXDOTeWYToJsqgZmbVz4Dz5RYWh/XlANpxHTo1Tx9aSuKEsr1LONNl3hwph3J49
         ZZMA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=2blD5sbznpPxYkLm2NjhWs5zRCvikPOMuyLShgCndS0=;
        b=rrvedEspX4LPkle1BgAEc/+dIh/sY1mF9zOwlKpZMl3Y6KoVWehZ8PCS0TRlFqHEtC
         75u+Jrc1L2CYr48zKzgfSoNMm2iUVyjcu1vrpLS9q3fec8tvi70JjfQJjhU34CSwSxLB
         6o14WOCLp9GnotfopCEoXVyYa1B6fKumOfR7y6YsyZz/AnxySeASKWnoxY+Zi8w8vzs0
         iRwAdum5KT7r5zaE+co/N67KD6XLz7+ZLe6XDN5JSjTNvIzym+tPTvHUr/rEKZtOOysx
         Hs3cdbRdKpeOJQeTj318DcaDpQ4PwgwLElMvEP/4eGh00l91ONpBxA9hQ2zqetB3Osj/
         da7w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b="bhSw/WoT";
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=2blD5sbznpPxYkLm2NjhWs5zRCvikPOMuyLShgCndS0=;
        b=QwO+LMpm0bwtt+kToEmkZ4piAAv66SworDofWkFg2iaya8tx4WKY9RdXpAgmeIZyrr
         75gjTjgGMHrGGEhjP6utSW9k1aP9Zq/ASiGqC/qRFxG/Q+ybg9YvQp5TnlRnwq/kaFbz
         N/UecQQlS9Y3gg/5GNFFSe6w8wM8a5qUluxvIvOdvX8nHtFizjkbvH3CvyNBMbMpTFkE
         Qf04+YWCbWONwswNfzFmBCC1MIztAalykzyTu+fyVYMCosMOlE3fnEWESy1xVxCGG/zJ
         zS1vVU0EadyJD1W9DlAPKCI9ymMwYRt9vUpMpHZToiv64/aMF2H92jRewMT+Cz/+tAKX
         nsUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=2blD5sbznpPxYkLm2NjhWs5zRCvikPOMuyLShgCndS0=;
        b=J7LwFo4lPv28YgqOyBEak9p3W67wSeAczUfthQ2l8b0lkDZoaHvRw4esFs1AqSPtk1
         y0JVltdHct4ASHQJguc2JslTXZrT7CEBfxf2KAFQ91vbtdR5DkwGMj79Ins/d8ZO8LR5
         SdK6zEKA0G5Qs0dJ2wvhZj8kwoCXs7FAm6mfWOoavURXY1pjgi+SHc924+UIqNVwVTJa
         Xay7OgXb/RVO5A03kJrykR4HGbggv+1uoFgJQet8SkDw7/vpIitPXzcvOdjc8MSthkOk
         H3BNd9lj/u7AZmb4Bfe8S2m/Oa4mBMe5iNtWgWWmdC2pMT8BSZ5FMnoJW9vdgFoFqE+J
         UC2Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5332gHF5yF0fCjSH6q2VUOHFwHeOVu3AAmbzk3+wo4SegoTrwSrC
	dOam9fnI+BPi/zmfinOicDs=
X-Google-Smtp-Source: ABdhPJyMp9sDJDm4ozBoszYCSQEH4leCqnop47sb1UmdWVSQG+D9bPxq6PKeIMZmCK7LfHVTWZ+jJQ==
X-Received: by 2002:a5d:664a:: with SMTP id f10mr1548487wrw.64.1603919391504;
        Wed, 28 Oct 2020 14:09:51 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:f7c4:: with SMTP id a4ls416870wrq.1.gmail; Wed, 28 Oct
 2020 14:09:50 -0700 (PDT)
X-Received: by 2002:adf:dd8f:: with SMTP id x15mr1557332wrl.124.1603919390527;
        Wed, 28 Oct 2020 14:09:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603919390; cv=none;
        d=google.com; s=arc-20160816;
        b=usQtgbXQKgFTHldDBlrHkpddiCeRwscOmiMduIxPFzDekrlJfu07shwe5AM+WG29V8
         r80T8Ku7YZ1dujEd0FScfgu8b9Ns1M6Q0/0/cbWVtQHhKs/emvqIZoSSZyj7e3LdkE30
         RNbzMkXOSyIKZpwKSLtyxkMinZ+pB4KDNfYlqDJnrUYeA4r2CLsKX255S3tebftEyaEn
         Uv1Z3IHe9ai+nkEeg+O0xwaAedm9ugG+i/KNTpgI9W3bPuN+TTdurxZUhrnF9zpURpP6
         LLZ8AmyTkKhub9x2ftbOvE2KxFV57rrmCZ2aswAirFdjnSa1dGuxQ6vcxMIkA0vZ+LBN
         Kn5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=phKFGIrCZyPcyV1LXI+8Okc7Iq61236DpMmTbVjIi8M=;
        b=BdPk/u6atKfNgvUERCuA3XL9IqMzjCGSK904YJxNg7D6Eqnc69YC7cl8x7XwUkKGO0
         gcjGewuBSZOiDPDYZoSVBCft8Bre0K0eWx8UoBD5ek8X8nSH3dcfkqcAujmJW/StE6Hf
         EY/WXnhATjhsF4OLmlaxfJwLHMfCloEiDXZ9+Xp0TuV0RkNJKPTRQoQYadTG0qyNaDuG
         2w2KjS1kAjZVQN7ZZYx+gQnUkRFDZa8C5j71iR02y7tsm6yVsDrrDMglwiyfjEZRSusF
         i1YqJgKr6u1zC9FTGhh+1kis3mpI1Yik3HddrSnkFUyMLb2AX6DfyASEN7vSCyVcIsy+
         Cmrg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b="bhSw/WoT";
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [129.187.255.138])
        by gmr-mx.google.com with ESMTPS id e5si22068wrj.3.2020.10.28.14.09.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Oct 2020 14:09:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) client-ip=129.187.255.138;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CM1Rf2SJdzyWR
	for <jailhouse-dev@googlegroups.com>; Wed, 28 Oct 2020 22:09:50 +0100 (CET)
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
	with LMTP id bC-y0jN6p0sB for <jailhouse-dev@googlegroups.com>;
	Wed, 28 Oct 2020 22:09:50 +0100 (CET)
Received: from kabal.lan (ip5f5ac6d0.dynamic.kabel-deutschland.de [95.90.198.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CM1Rd62sHzyWs
	for <jailhouse-dev@googlegroups.com>; Wed, 28 Oct 2020 22:09:49 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v3 09/22] arm-common: provide unsigned int PSCI_INVALID_ADDRESS
Date: Wed, 28 Oct 2020 22:09:20 +0100
Message-Id: <20201028210933.138379-10-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201028210933.138379-1-andrea.bastoni@tum.de>
References: <20201028210933.138379-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b="bhSw/WoT";       spf=pass
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

Avoid using "-1" to indicate an invalid address.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/arch/arm-common/include/asm/psci.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hypervisor/arch/arm-common/include/asm/psci.h b/hypervisor/arch/arm-common/include/asm/psci.h
index 4b724877..a24c0cb8 100644
--- a/hypervisor/arch/arm-common/include/asm/psci.h
+++ b/hypervisor/arch/arm-common/include/asm/psci.h
@@ -42,7 +42,7 @@
 
 #define IS_PSCI_UBOOT(hvc)		(((hvc) >> 8) == 0x95c1ba)
 
-#define PSCI_INVALID_ADDRESS		(-1L)
+#define PSCI_INVALID_ADDRESS		~(0UL)
 
 #define PSCI_VERSION_MAJOR(ver)		(u16)((ver) >> 16)
 #define PSCI_VERSION(major, minor)	(((major) << 16) | (minor))
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201028210933.138379-10-andrea.bastoni%40tum.de.
