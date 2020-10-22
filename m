Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBSMQY76AKGQERTZY6IA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id 0388929642C
	for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 19:58:33 +0200 (CEST)
Received: by mail-wr1-x437.google.com with SMTP id b6sf908605wrn.17
        for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 10:58:33 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603389513; cv=pass;
        d=google.com; s=arc-20160816;
        b=VQqVPiwJNddG5wNc01jcqmxurWqyLpIi1sD3fjV4LoQIESK1YTs55WBhn3ZKSOXNSa
         Fi1c9VKF4Af3Mzx84H0sEOoahqw8Z/p0v5iHW6tIXp3cgPaNjvCrtNL4fV9sqJeN35Kk
         21tYecWz+Kwc+vIRdNzhGFpIcc1bM3wXu4Wax4sffFQ4W58QeaQPjPOXvhhHTuCWypLV
         gb5uPQh+0AdE7OiXb223YNoKhqouE0HIBBFj7I1kWjj0ZcYWtyk/Crols6/qpldswCf2
         RRRs9FCGcGThbh8FiJ02TDcTS6HEyh4fqxDt/iEM96KQpoPIZnMYMW5YimTq9vvYn783
         rwRw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=6XD6bP1EzUVnQpDoljVivyw8q77tK/FNu9pDcEpuRPs=;
        b=O0xHZdN9CFH0EYzyUg1d3w5DHi2GN65oyrLi6W5WPN4dF/t6bUKpAKOvj1scrUrw6t
         okdpnZrCr5jldnVAMoL398Qo7DHsu2cyCIEsv50pknL3HrJ2MBzKL0AnnmDmo0fj1bR4
         OsUwvXSWYyMRYy4KulOLIQgwDXDlW8S338vv+QQvP/1RrL8qoSZnrru+5sMHPTfK9d5B
         HX7HlIx2t4X+9bFX6s59jzs3z9ab5CIV3XZkS4iDiGgRnwg+iBlrf6wJQcTnU+qf07A5
         7XaQuR5JiF8m24egvyE0+Jd/hr5VDCxXWGv1lSoVVHGnOqS6oiytZ9v23iKEOyvomaWM
         jHQQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=EJ4aZjFf;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=6XD6bP1EzUVnQpDoljVivyw8q77tK/FNu9pDcEpuRPs=;
        b=sjcf20R6uq2Os6NdPAexgn0wFQGaymfjNdErFVzuvziun6vlHeyLUJ9bqF6AoYRdD9
         8aqsuBYQsPPQa6uAyPoDyZlZdJuiqE1vgT78gPYdtcBGo8dASNUgVXZC9OiIQfDZ1kQc
         7gjXaol8G27KUQUcSqhhTmdAairqo+LckNf5CprmoooDZ4dgsWE75wOr9ANfFdSSGFnc
         PIk/ZXap5Ou6aunvVXGnolysrReFqJpCwLYxAhyXIN12/Aj+YSfndCf68uOGSbIkacIQ
         nqmKJ1ifwcjEmGmDkLNMtip0E/1Z5FPAa3X/too9fxJLofg5lBVB2cZyzTH0XmJebeK1
         sY6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=6XD6bP1EzUVnQpDoljVivyw8q77tK/FNu9pDcEpuRPs=;
        b=U5ROgS2lc/U9DoHJoy+7Q8o0xb/zNT9vvqnB++0/w9fwO1WFFNac4nyeTRjLBfbSTZ
         Eevojou5ysti8Fs2RdW4hEzs9L4tMZh0mpsrMa5mJYc30vp+zxvq8ikcWtMejbZdHexX
         1MfEVZU549mcOS3sGmzrpXAhlNY4rcp09HPYyE+2TAxj9hWIZT4DuWBh/AzSpRRpKRP/
         kLvR+Bn2D/qyGXWB/dVtsNKYc6a0Vic5sZ1f1e0WA7z1uLF7n3tAqPVEVD2gqrwV45OF
         KFk2oex0vopKnYvVlkPqCs2K6dh85y79ddmsClIsOhvN3XqJhL1bJa+9tRu4hx8fmohY
         g81w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5300reO6DddB+4TW/UtLjCzz14z1xAXfOY9wElm5vDNkyHmW+3Gy
	PoymOvlX0Q9ZalJl+JPu6Rc=
X-Google-Smtp-Source: ABdhPJwtp8WJ/E/Ljp9ito1qFrKsJYO22mxnkEzAWyBBq4sBc518eTX0KY0JaH2H9uqP405pp4keZg==
X-Received: by 2002:adf:a354:: with SMTP id d20mr4320982wrb.29.1603389513761;
        Thu, 22 Oct 2020 10:58:33 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:a544:: with SMTP id j4ls475435wrb.3.gmail; Thu, 22 Oct
 2020 10:58:32 -0700 (PDT)
X-Received: by 2002:adf:f20f:: with SMTP id p15mr4015774wro.339.1603389512694;
        Thu, 22 Oct 2020 10:58:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603389512; cv=none;
        d=google.com; s=arc-20160816;
        b=CvLJLI02UkG9B680IdC83YZfr1kBK2ThWVJv3Z13utto+hhCdFUqoxgll1Xj0O3VXK
         yeSwRKfEhbzPqiAiJxLahiJEOdKigb3WERbzMsqznwgQMl7prVQjlou/l2PwGSKJ/9ev
         Ge5L2vhisSb+0NhTv60pBOfxI/JaQtcXGGSViFS5Zbg6N6h1dSkA2TlFTt36cyISynMf
         0Wtb1UWEK0R8mLaSxb+1fWpnBMy3v77NpUbfM0JFyfCKKwkIkVzAsDVTNuPsczUNbnOQ
         1AKUlQO1t1Q9h8a+4oXnTpsVKYFQBTL7jqC3qRZadoyt1vKGzBfyKZBGO6VNtnY/xiLp
         SaBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=+yhauOZiDlDjE5Qp8MdEgtzGWL//iiTqMIU5dq8m2tI=;
        b=OLoivphY8z9xQtVlQ3hHPao68A7HhaQFtdc2hATqPZK/bO/N3Tz2vPfI1YWgEfqgfn
         Z/hiHqIwFWVkVPJ8D5W4h43vT6BjabJELg3+cW7lNxtMlUpIncDAClhLHUK9zZExZC7+
         a1gqwBnALN1EdcnwhsiSkiWnMQCi8/PTrCuhRevmT98ap4/erjsSkrrPCKDNpGpDmC9p
         1Z4g4ZMZg2q0CGzuEmRGsI369c/TrzkQMu1U7hUQ7E09vDvTfeIyaJ06atg0s0mp/564
         hgdxwJAqo0BIQh5vyS4pLfYlpzKueSZy0rz+nvL07zYM5C9XWxFvMiRMFurS0eW9xGyf
         D+3g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=EJ4aZjFf;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id f131si56960wme.1.2020.10.22.10.58.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Oct 2020 10:58:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CHFTh3dkmzyVH
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:32 +0200 (CEST)
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
	with LMTP id NKVX90xARqdC for <jailhouse-dev@googlegroups.com>;
	Thu, 22 Oct 2020 19:58:32 +0200 (CEST)
Received: from kabal.ads.mwn.de (unknown [10.162.12.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CHFTh0glrzyXR
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:32 +0200 (CEST)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 01/33] hypervisor: Makefile: hook-in -Wnested-externs
Date: Thu, 22 Oct 2020 19:57:53 +0200
Message-Id: <20201022175826.199614-2-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201022175826.199614-1-andrea.bastoni@tum.de>
References: <20201022175826.199614-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=EJ4aZjFf;       spf=pass
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

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hypervisor/Makefile b/hypervisor/Makefile
index 5322b5aa..ba66fdf4 100644
--- a/hypervisor/Makefile
+++ b/hypervisor/Makefile
@@ -28,6 +28,7 @@ LINUXINCLUDE := -I$(src)/arch/$(SRCARCH)/include \
 KBUILD_AFLAGS := -D__ASSEMBLY__ -fno-PIE
 KBUILD_CFLAGS := -g -Os -Werror -Wall -Wstrict-prototypes -Wtype-limits \
 		 -Wmissing-declarations -Wmissing-prototypes \
+		 -Wnested-externs -Wno-error=nested-externs \
 		 -fno-strict-aliasing -fno-pic -fno-common \
 		 -fno-stack-protector -fno-builtin-ffsl \
 		 -D__LINUX_COMPILER_TYPES_H
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201022175826.199614-2-andrea.bastoni%40tum.de.
