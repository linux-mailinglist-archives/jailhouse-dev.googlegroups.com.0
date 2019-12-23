Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBOMPQTYAKGQER3JEZPA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFA21299E7
	for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Dec 2019 19:30:18 +0100 (CET)
Received: by mail-wr1-x43c.google.com with SMTP id v17sf6771738wrm.17
        for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Dec 2019 10:30:18 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1577125817; cv=pass;
        d=google.com; s=arc-20160816;
        b=bJRGMLU6S9b7E2aQzHLjWWET7xY78zHwa6wLweiEtpb3kv1sC2kasPAQbPEu7HYxm2
         Vaq8AQTXWU5ivRL/GQdvBugPeOyTnivZeNwqudQ2OImTy6ZMRDs1J3cTOeNzQ9o/Z/Us
         ijs5Psoxbobh4mZoBPGqaiwfIE0pHcQ/J/wakbIg8NlXOL6Flmz2k0mIiYo2k4b4baHJ
         Iu2aVkRoBAuZE6M4d60z4TH65RdgoDz2MGf05vz7Y15efuMYOKUs6y7tMr/Balf0nGfg
         8OXM7y7+o21zsoDmLSXjuMy0zdptBFZN/ZsMrlWPySpa0YrWTBrOEhIVERp2Wo8lTArA
         ApoA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=H45+uQVsVH6B6+LZqLWqJnXFlhNCc1BmZBtIgDXXxQ8=;
        b=fzwp7Q9672qIEC+JeZ4n64vV4cj+28NMAgd8RQTGsZykjxd9t0u50GnoVTOR06gZY4
         icJQBP1Flz4753MZ1elYt0fIpTpLTwAaYtzViE/V1SVvqmoTQgL7d4+jpC/zKy0UHLFg
         WGhv100axl5f8A7PlptRXoIzEsml9Yk18sajRHu0C5HHXscz+uwWRoFt+ZmrKAJ+3D+p
         1JTQmqOE3iB97/UbFHSy2dSGppn+E2tJsr/ZbSuszMVn91QXj8nhmmxtKQj+08amLADG
         Cq44xNr8EDRqvOewJQFpOCRkBp0Aaz9nQ2pHWWsHBfL/JavIHNzXaOVOHDLqtmx4OYgO
         RpAA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=J3qeCTCD;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=H45+uQVsVH6B6+LZqLWqJnXFlhNCc1BmZBtIgDXXxQ8=;
        b=JKd1RAMMeZVp29yyvfnZ9Cyqt9kRpfIZ5SpAa3V182C3ki+xPV5+M8+eC9gS3J24lQ
         KHXj3+BkAIHNNfMMxuoA77LXuaBhdKgzDI6HorLIwUdaYUmXBAwdRFCb4/7f0GDy77Qv
         apyBGObSGeFYhwQRXVZxoaTpAQ0e05vFNMI3evDmQiZjgbdp4Z7b1uNpRD8skJ2c1MCT
         sGhhTFM/JO7Y2vS/nttPJm0qP1c1JPfVpwaxF+XW/x6TFMMW5BzhsHptksQu+SqmI8AJ
         iALMfG95GerPtXLNkIi4JqJJo9F4KJuXSRhPgitrjgCRk8m4NhQZGNwyDTDNS48tB43F
         L+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=H45+uQVsVH6B6+LZqLWqJnXFlhNCc1BmZBtIgDXXxQ8=;
        b=rcFQ9muW2E6giTzxFa6vftK47sOAuNMrnER92iaqjc0FsU/EnOVtT0oVFWQ+k6j0FK
         RMrdlo7OdoeFUHh8VpGTSdi1TLMexjjgY6QBmNkL63bxXJVmwoe8uSNxcJKJ3WpYrr8z
         jK2WeNuZ4LItaKKjm0QEdgQsBkNHWjMHQLO1E0miACoUkDD5wa3BSF5n9QRq+rikZ36h
         ypYWzdHHvnjE7JQF6h78kgs/4HALTArNjAbifGhwUeqtxOb2Lg7oNY5CFksqtSgkzxOA
         KtlunmAFpapO1rKZ9pMNU0J4ePV/hcQ1h43fvK3XXDaGXMPVrQL4DARDNed/m5pRPsi6
         GmNQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU5uJVz/i7rwmQmrnT9r4TwKCV+ilR2fCahZA3i84RBJeB4lbJC
	oMtRPg7lLc9L1SJI34HjRJA=
X-Google-Smtp-Source: APXvYqxVtDqlVemaPFq4Uk6n36LNtyFlnNSdoaKcxBPp3mZ/LdbxQJ2dQAS5LnwY/pnRLs73+9n07A==
X-Received: by 2002:adf:f581:: with SMTP id f1mr32158138wro.264.1577125817796;
        Mon, 23 Dec 2019 10:30:17 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:65d0:: with SMTP id e16ls4574833wrw.1.gmail; Mon, 23 Dec
 2019 10:30:17 -0800 (PST)
X-Received: by 2002:a5d:4481:: with SMTP id j1mr32524858wrq.348.1577125817274;
        Mon, 23 Dec 2019 10:30:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1577125817; cv=none;
        d=google.com; s=arc-20160816;
        b=T+AL6qAYnxHC8M6deus1tkfFR9OkJUwnzC6V1mTmCoJKZ7JqrwMs1k0F5jGlDTJYjA
         Te+uxtyrFnEsEFNNJZjQryr4FvRjuABwp5As8DekAk+9CtiN535m+VirWJ4X/+/xDmNb
         VzFRErLbWVdwg96nSnUPeRuxVY4x5y9E3BCpxHizPFFDJ1/IuPc99phxBwDues4xd9sO
         a5cw54QLSOut0L9z2fP3nEeDirnKc7ds2qUD9wI7FMKemkX9WX62npKhSiv4lXZDhEqF
         D4Sq3YmniVMSnDAW1v/aR2TkSAlhkikWHTujIVdADedOrf20SrKCwwARDmuJkHAaf6qM
         ST9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=Zt50L8vEowhsCWaKMjB20Cce7NrxjvP+QYQJ+vdAqcU=;
        b=DcNrtKXTguODEKxfVW5cSpfFxEmEX0ksQTr6cas0NwEQHwUqqQNM8mDsER7GxdV+Cg
         ylyW4MdkrQhO6NlKe3ZXSKM1J4JgRJ9Ybcbs/sM1Nf+ZPN1E28AhgBQVqC8LE3Ke628g
         wQr5d5gCMMDBLXVg1qaC+8p8V6TEzpcMzsZoGxrvQ8ob393Z1wELRPXurJJnTf1Zc8qk
         Tl6/16ahbEGSC8GaiV0TC5Y0eWeYx4DzWmw/orZ9CPVCi0tVJhpKpj744xWC4/1aMmql
         Ob8VK998vFUjs+DITZB4qM8bzaZ8PSPo9FrckLr2HQ8sflhov+lanw6/wtbeyVuMxuB3
         kj4w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=J3qeCTCD;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.11])
        by gmr-mx.google.com with ESMTPS id 80si29064wme.4.2019.12.23.10.30.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Dec 2019 10:30:17 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) client-ip=212.227.17.11;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.mchp.siemens.de ([84.61.93.39]) by smtp.web.de
 (mrweb103 [213.165.67.124]) with ESMTPSA (Nemesis) id
 0Lmcf9-1jJ44R3JHn-00aFMl for <jailhouse-dev@googlegroups.com>; Mon, 23 Dec
 2019 19:30:16 +0100
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 6/6] scripts: Let header_check cover arm-common includes as well
Date: Mon, 23 Dec 2019 19:29:49 +0100
Message-Id: <b5ef548cec668376ca65492dbd2dc03d9e8cc489.1577125789.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1577125789.git.jan.kiszka@web.de>
References: <cover.1577125789.git.jan.kiszka@web.de>
In-Reply-To: <cover.1577125789.git.jan.kiszka@web.de>
References: <cover.1577125789.git.jan.kiszka@web.de>
X-Provags-ID: V03:K1:TfUxpyvn8qPvE2ZOGipZVz115A0TnKYd3MTgBJaUMzF1vrauQuB
 rZ/QeNPi+wC0Pa6DoOIEp9p5gQTrW8+011/oyFhYsI/lMiZKSUpaaysAyg4LL96h9ImSqxc
 6ue7H8iQ+xawd/9uXTfb+wonCKQDreek2TvAzZn68GD+O+Qlw+waOj0KcXSPop0sedsICKE
 wAQ/bBnLKFpcrgMs1bAig==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:5CQqRZjCiQA=:X6priOHBUezd8Dr7QV1cT4
 GBICHJq/vIAPK2zrt71VvCwzxqjJN9RjEGwXeqfVsdSQMHZWZ7ioeDX9mATvKM5ifpOwBQqNN
 FCa2b0tvXK5Bk00CgiIlkaPKaYvKOtEjVQfkOFuIEI/tfDuUe5KJR3nqkjpimzARHBbRm6nhv
 6kK0JIhdgPo3qZmhdDxD5aBRUEPOa21uHbDJsDmHkOnolXiLt0g6e8p7to2//smohibe0XXfG
 e1gzg6YUpmJwjHZwaAUPRykpOL4bwSMLOzXyPN9m1ymNdyoa+3vxkh3Tp7Gm7crTGPL66ZjQg
 0Zo/ol4SqPKE3S0JEg19J1nIYCDjk6Vui88kF3eKhbgbN3CaK5/Y/icSN7F01cGcIhgvheW8L
 7U5h6wPg2H9UAEMc8/OsgBf6zyVuIDL38MidrRZp6V9aRJnYJizHvCRCB+MnNerOo0oBFdF0W
 3kNGS4KywRy18IaPyy282OvUq0Oyd7yAZNlm0TId4Esi3S/oLKMAYuvKf5HGhOW076TpxdaqI
 g6IJqEeVaV4l0MRxh7dIXmpcE4xF1P45TX+mDThcsLzIVH1+Lf+2Rr/P5VL24peL08j6XfU9U
 QDug2X9Rq5f5OwAPG0Z1lCrF2VTGO9DZv7lkb/XI1eIs7mij8jH7OnDQ1LNo0ZwePELq6br96
 1ofreGCVd5pTOLts2sKXq49PZebPX6DsWipPYh5U84TauIvuiyH13UTZho1UxkFphM7TrIqTg
 6pcu4GjDDIZzsQeE64h3Q+DkQci8r83A4MWiHyks74671114Ellg7ABqep71hkagEs8LztMFF
 Yn4REfc6t9gascYs5RNk+aWX6JLAvumV8Woa/KxVIMP0W/TdXbRrf0fwY0T12zp/q7+atHT0E
 vRrMH2GJanL9dF9rmsXgR9Ye/AR8ZV1264MDoVl17JK6D1JpDerow9Ar/Tg4raRZrzFCDE9QG
 ZcgXrXq4pYYDgGDdKvcQQVsWuesILYYcJqpjsubE/XhR2/hMl1DEBUF+ww9EkFD1G7cIx8Cvm
 xvs1fowNTE6gZiqQ7q7xgqzacWpC8GnBBXkd0PWdyNDRn0AH3rCPiLjgeX2UnlUD1ANkJ/nJZ
 jI+5s1C7T2GvKjxrJBIcc/qsh/Mj0uc0S4ol6VhaqGAFARNJ/BvI+kEc1K8oMZAzvL2W6kujA
 jQSgYwWYOTULCJ4OpICWbExkTOXHlYOz/u1T0iSpPdOiDQnvN6fQDZrxgJh01t3o6FK+NfHJm
 4B4mHv7JjCfJvmgfqUwf05v0i8sNpYTbKcbxJaw==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=J3qeCTCD;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

We had a blind spot here. Just make sure we do not test common traps.h
because that one is only supposed to be included via its arch-specific
companion.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 scripts/header_check | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/scripts/header_check b/scripts/header_check
index b51f7900..05e08fb3 100755
--- a/scripts/header_check
+++ b/scripts/header_check
@@ -42,6 +42,12 @@ test_compile()
 		prepend="#define __ASSEMBLY__
 			 #include <jailhouse/types.h>"
 		;;
+	traps.h)
+		if [ "$2" == "hypervisor/arch/arm-common/include/asm/traps.h" ]; then
+			# must be included by arm{,64}/include/asm/traps.h only
+			return
+		fi
+		;;
 	esac

 	echo "$prepend" > .header_check.tmp.c
@@ -61,6 +67,12 @@ for header in hypervisor/arch/$ARCH/include/asm/*.h; do
 	test_compile asm $header
 done

+if [ "$ARCH" == "arm" -o "$ARCH" == "arm64" ]; then
+	for header in hypervisor/arch/arm-common/include/asm/*.h; do
+		test_compile asm $header
+	done
+fi
+
 for header in include/jailhouse/*.h; do
 	test_compile jailhouse $header
 done
--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b5ef548cec668376ca65492dbd2dc03d9e8cc489.1577125789.git.jan.kiszka%40web.de.
