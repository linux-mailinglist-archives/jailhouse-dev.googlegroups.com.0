Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBD6RXPYQKGQEJZZRCAI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id 460B714A542
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 14:41:36 +0100 (CET)
Received: by mail-wr1-x440.google.com with SMTP id u12sf6079419wrt.15
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 05:41:36 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580132496; cv=pass;
        d=google.com; s=arc-20160816;
        b=fSLFHF7ABeFkmx7bx6Yk7PqIJUt+zoyWXLEcZxOQa59VXN2Mm9UqLSSErB58blzNC2
         5BK174/c4b4t7cEs/9gEGU21s445RR0zBDN4MA+L4w0mpH/viDluiCFPj//5o2PR9hTW
         doRFf4HAGv8ejRHOdNNhS2H9gF0lKK0cZ7RXh0Q/b1rPwypwtQZ2zJId0jsMyDG49p4G
         K4XQWOLAU9mHa0Np5iJaUzQbcPf+yx6hGUpHnmIYgeJGOdtYl2Qt6cXJVhxPn7wQ8WrJ
         Sc81AM9KZVykD4oodXX6KtAMuDItMio04hzgTr7u/ILfXt1fQpvoqvsx1/GHvFiy1jf+
         FH8Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:mime-version:sender
         :dkim-signature;
        bh=+AbN11t9hlHcOVEts+RdMOdSJoPIQTltzL1qQYsFvjU=;
        b=Ob92VdXO33RkhV9pxwPDLtTz/JR431r4FyavJJSvaTqRV1Uoz86wAIZVF94oGn7Oie
         pV8rvoXyepQ+EirdkLUQ6qMgg0gbqxUxOhN6vkYrGaCrb+AOYz3jjCuECSpLlfOlpyVA
         y+pwQFJitUTDzSS6e0GuVi6ahRScYDlfZEXSk91+l6OSep157khsaxCsfbGWdK8Q+oVR
         8Ul7K1PxhTf+VaeCCobLX4FYsJE6hT8g4RfpaZkUXmejKfse4I2wyZAqYghnO+DJPSNb
         lRjbQd5ykUZ2zCvbtGT62Szx8jQk2xQMLUVzoh5yu1PfSPfB+K/tIP5aHwJ7Xm6sUtXy
         UChQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="VUqq/mL/";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=+AbN11t9hlHcOVEts+RdMOdSJoPIQTltzL1qQYsFvjU=;
        b=it8a0+OFbFId8oPFjDN2BggExwMfBVCijPefsK9YHvmGR0ZRbP70U+VO0siI7FfK+T
         uasYYON4g4G640885R8GoTcj0eujORm3TSODlsAJXYH8i0cgDNTfPxyUCFviVx0ksTIn
         3FOKwCgFXcXsu2jqL8JUDnqoA1Jqx/QSRy2R9FmolGHCZvbkGYalABwMiK90xh/aZ2ah
         79dOrDCC1F8+5xU8CxaepE4x+fkIx9acYUKm1Sk+Bw9gmrnY4kG2kfJmdJ1BT6dekD9j
         TPRFu5+P+Elz8c+jQio/HFpabFdRsiinGkZcCgh7EX0BEOJOr5Oonsj9NIpxwQ2uJ1qn
         5TLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:cc:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=+AbN11t9hlHcOVEts+RdMOdSJoPIQTltzL1qQYsFvjU=;
        b=oq6eojQQhG+eQAYY1rQM1OFjLvugY2Jh6Xtxg8EmcR5Gz3FAl2rVGZw6dGjtdXt5C9
         MUu7BLQculv4qm5NeLTYmw52nmpddmg/I5mBHkymO/o/i3g+24ahhNCX/VEp3oVhVJ54
         RVoRBg0AnCogCELYBpEjPBWO6Zqz5BhyWzbTHu4GZ8J+tzvnkZ1eXTHY4KIMC0Z5WWy9
         LXr18/KggRXUsNWHfutyQew9HqYYZKfBQOcXjiOt4bISmDEN+Bdu8YyRp+TVT/mNfv7R
         CKYHZ7+6/fNaLVZ5VpDQTzjcqx6r8y+xTzM1BlPR9JnZ+1iltbxge2SCNLVfRlFst0g8
         d5Ow==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXPScz0PW75M7EPcKPLVOd7bOjYBMrTPBfMWesYwwhLZznAyhAJ
	72M0uV4s08Tjb27rBVRyjv8=
X-Google-Smtp-Source: APXvYqyh84ThC30lvz6FOGhJWnGJ/KKMUUuZCMsrshQJle1CtTKIdpUdxqYt/tWenrU/gzlWc0+h0Q==
X-Received: by 2002:adf:d850:: with SMTP id k16mr22211206wrl.96.1580132495949;
        Mon, 27 Jan 2020 05:41:35 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:288:: with SMTP id 8ls2865448wmk.3.gmail; Mon, 27
 Jan 2020 05:41:35 -0800 (PST)
X-Received: by 2002:a7b:cf12:: with SMTP id l18mr14459639wmg.66.1580132495269;
        Mon, 27 Jan 2020 05:41:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580132495; cv=none;
        d=google.com; s=arc-20160816;
        b=IFF1kBeNCSGZaWs9jAz/6lOCsyQCvbkkQOAsUjGHV2jB3PNj2V26YA2iK5wPS4P/oX
         y+7SRDpfGWLlEfXJVniJVcsSf5qaUIcMOHN8I9ZF6Lit+dQfk2dI2YAvCamIK6RGXnZF
         zAELQDez/IZRpp9BChSBzhJzFeNcZrh2T1cW07+BveMCInuNxGPYe9h7fIov87Z59C8A
         mEnQVoL1I1SP8KQdnrPrfdoumiz03qA76PYc9EkIXwXqqZjBWX87b8VvrprhBCDt90bV
         e0DtH+akk5zKRTkZWzRFht7lgyb/ArETPDDDgZ4Pc9x0eSNHkhYj6xbrWn2yQ4Qwivr9
         9j7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=SE341Wg+tZW8bsGcbLvaaChfreB+ozfoGbUZcp9w5IY=;
        b=0Vu+6KxtGZ2bf1SuzUfHg+iRqAtRHf1ggwgofqZ692loYnTScjSSx77V30cFj3gACC
         b5hsaBxmNvSZ54+fMo0oMIs61e+AYuM8+TFkvI2z90HXoy4j4LZUvY1mSybxbDFfSd5v
         pCiR5LKwP2YC6ytgN0eat0k/8lo9OIrl2R1gDvmRvuRBWWK7h3YXJkjlT+N6z33NEGIl
         Hk9v3gINcTvqtTMz6U6QIvd6EV9fPzDkvm5zqwaXpADkkORIsChY3pZ8UA0uBsFVQw/0
         ZacPPFveWMQPFZz7IMJg3O2TBW3fitYOrRKE9QS5rpOXQY5Hb9/kig4NwWsaD6p3xqvs
         Ssiw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="VUqq/mL/";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [217.72.192.78])
        by gmr-mx.google.com with ESMTPS id m2si913591wmi.3.2020.01.27.05.41.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jan 2020 05:41:35 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) client-ip=217.72.192.78;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([95.157.55.156]) by smtp.web.de
 (mrweb101 [213.165.67.124]) with ESMTPSA (Nemesis) id
 0Lfj2k-1jNxcS3Yss-00pIKQ; Mon, 27 Jan 2020 14:41:34 +0100
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v2 2/4] arm/arm64: Pad comm region to natural alignment
Date: Mon, 27 Jan 2020 14:41:25 +0100
Message-Id: <6665ba4a7bb1884cbeab01df1f1203769a42dddb.1580132487.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1580132487.git.jan.kiszka@web.de>
References: <cover.1580132487.git.jan.kiszka@web.de>
In-Reply-To: <cover.1580132487.git.jan.kiszka@web.de>
References: <cover.1580132487.git.jan.kiszka@web.de>
X-Provags-ID: V03:K1:K/dB5L42oX0LihuizFydHeUtHmYlr0kp5njl7s6rHplMNwvh9SP
 t16V0ip3VlBnSz6cydQwpqLVSVGY/nKsnTfLjW3BxzQ3yTASBMB4nqUHCXDSGtefVILNexW
 oh2H4cp0DO44ghf7AcX/po9wWtGzLDxwpoXRnuLqbGITdhVnQwyNLLNsE7CTv49X6eJ5zPK
 Gx7aAU1p6HT8CrHqfRigA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:VU5nugI0csU=:KwN7XL8mLUdLS8d51cQ6i+
 fy2qwkGLlfPCxEe62TOnFEfrqNZThp7THCn5MRYRAWFe0J/kzpo8gFdU9PoDDIFRDY99Wi2QF
 L0E5AspCvEb7aAlFbKMytLBrd3PzC0Vlumur/AGfc7A5bQ6zgM9r0dGD1r6j4AQQG0Lc+r8PA
 8iE/gN4TljBiigBrzhCRCGY1gV6OsiMZqJSL07OqO50tcu9KRegC57mUsa5ITcJShqX7YApqE
 aTY9GRx1D8ve8kS2uItWEOxgrjFpNnyEF2ICIfBGgDko+tc5dZN9qCKFWBY0ocbDuOo9x/mY7
 WqkdkanOkM/xchOu4y2z3m8ywtp0YnhQbpUZsd28+xtpb3qhez4qwcY5mxs4XCd08AlwnZv3j
 Ab8kdbKX8s8wd0zhre7ynB6eG9/oTEb81q4DuFyY04Az3pgv5Xj08Y6n7CydUbb6QD1HOa2qj
 tVcjFnOrgsiRR1/6yuVBLT/jM/jqqVoI16Id+K0jwDHEpvnwE+5iAHzf5kmzRHDQMRnXPa5uw
 yX+UEUYrS6fL0/MRFhs0zLWej2FhZ4TQFET5sD4VV031xjnem4K9ejyoS2OECnCZhgXmcRO04
 jFiC6w4FMSNz+CMLlcz58oyK5zX8raTFwqYKpSghre4BMAmmeUEbjz9rHXJuXMoatc6Crt0JE
 Vx4hfSVBTTwar7bX3ROuGBl+Z+CXiMRY4WsNj8izxpv2t+drvoAkBXms9Y36M6/U5UuWEsVjO
 E8LB771DW562x4tyTv0E0nMuJNX2gDJ6gWDxMXG/+DP6TuW9E+K051K/lFf13konAZFwXnRFR
 Kw2/LQOxp4nsxCL8pTYyD/L3+lCJ2nGyVoD1bL1p5pxuTmx7T12zWgGd5pfJjwJbZMl42RKXq
 Ad53FChj0DhuFfSDrFXQH7tYUvPZfoeqlgRhErMojGkTLPiaYfzNSueaztPCF8SohfEB2YRfj
 PV4Msqky6h9GvvYgf27eL0BBczOs170zgbW2mWTOHIlv3hCbudICiPGXljkglg0voIr1X3W3o
 fBrJ0uE7PQ+Bn/YJIOwXDhcwuaUNakCm7Du31/UdrFdPfssK+Ao6oPbWIRd5xrkSK4T8qhbBh
 EiehmE7Vi8ubDjSEc4rtuJvZWjK4MP1rEYuXuKeSmMjlH/PuKnjXzcvYv/M40vA/SWNepsuDE
 8LIEi3t2/wcaTx8XVrJeBYmGyc24iRvrM9gJlu4Uj48iFjlHrkgJ/sCrZeePt5LC1rPK9v6SK
 1+NkyKmudEzUi0BVB
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b="VUqq/mL/";       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as
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

Better pad than rely on both sides using the same compiler logic.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 include/arch/arm-common/asm/jailhouse_hypercall.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/arch/arm-common/asm/jailhouse_hypercall.h b/include/arch/arm-common/asm/jailhouse_hypercall.h
index 83cec97b..aeab2816 100644
--- a/include/arch/arm-common/asm/jailhouse_hypercall.h
+++ b/include/arch/arm-common/asm/jailhouse_hypercall.h
@@ -38,6 +38,7 @@

 #define COMM_REGION_COMMON_PLATFORM_INFO	\
 	__u8 gic_version;			\
+	__u8 padding[7];			\
 	__u64 gicd_base;			\
 	__u64 gicc_base;			\
 	__u64 gicr_base;			\
--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/6665ba4a7bb1884cbeab01df1f1203769a42dddb.1580132487.git.jan.kiszka%40web.de.
