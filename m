Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBOMPQTYAKGQER3JEZPA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBD11299E5
	for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Dec 2019 19:30:17 +0100 (CET)
Received: by mail-wr1-x43f.google.com with SMTP id h30sf4632303wrh.5
        for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Dec 2019 10:30:17 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1577125817; cv=pass;
        d=google.com; s=arc-20160816;
        b=Zx7Sh5HIm0eaq3b/7as4NS28j3Vol8vRoXidGHHm0sx0K/1Ujj/u8c6RaBFJUOkCCJ
         frQyNz15gXYH3Dx8gJDIkq045AffQeLmiCfaMPK0q5SJAmFN+h6Zh8W0st7W0iB7NAM0
         +BXDtbLzhIs9mYQyIYGAk30NzdO8Qzl5/9m4CLk3z9K0U88yRFr8zfn4LRuLNDa818xB
         pq4+gPJYwQNCC/CjZZIKkqqfWA83PB4oKh9YNzLtS/ivhlpCGXoscox+fkPVy+JJ6a8I
         clDxco4o34A8CP7QqlBfp/Cki9xpIQAal/3OXZwzV54TG0epH16ameCyQQZiHnTqa9bc
         smPw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=is1CCr5YGtRGpZis0MS6npeLswFIwZhpBACFX1T9WwI=;
        b=n+1lVT4a759tq9XI3/gAv6WOgFrVR4UjwfYOernt/LVBUhDd+kfGUl2J+puDsnutIb
         QZHwHuvyw23zkcCfH/3cl6zvEhrVxw42hCwaV7Wv6GEYVWSAvulKi3gTmUqx2oBb328O
         Ux4ua3GgLZv5DOuD109lPQR5Akx7y/JvFtnNmHe1N0GeOVF5Mrs/fqOp2pr4ny56/2CO
         o7gGQMTpfP4lM6bwNtc0TH96wwn9TwPoi5sDWx5bqVZTFzJJEqazfX7I47vWPZEKuwHw
         vgJdtfhaucauOseHFh5yx1LTbFv84HUBcZl7LsbBbze99uSmh1DnEvty2cSMKV4qwEKl
         ge0Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=Mn7i9wIB;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=is1CCr5YGtRGpZis0MS6npeLswFIwZhpBACFX1T9WwI=;
        b=tB/8N5me/IRTAA8d/NgOO3PifBnCxgC1T3GCrj06aZCwH4z3jwKaaEQdldLpRiyt8j
         wZnl5yZHcY0lSgLz3jr8ED2US3p2vR+/9DVvZdwxNo35ypprSnSo5Afrc287o4nGbtuP
         pZ0ANDnfaR6Vw4SSBRye3k3FSRNfD3KkgC2VhRuoln7RWNX6+WHcKkV4uRGX53epVYbu
         Cp+zjCGcyVoA53h+z5IeVurgz56aSY71saPcx9N+hVzAn1H1CaQExRtHAGqG/untkfit
         qnb6KMmH8UeWXPlw7HDBiGg2bDakTF5poTOY8cYFaU7uABCTx0dLS4tEtCTiEI/zEt4g
         9TpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=is1CCr5YGtRGpZis0MS6npeLswFIwZhpBACFX1T9WwI=;
        b=E0Bq+1vac2LeQoPDQiz7M/lwwMmjlI3hxqYM/xilnEsp7TYZoMtO5dUNQ/qg8Gcco4
         7TbI5kFyL5byFQdckaargFSFJIB85NolML5mDMkFAr8MgvBYus4T6JnqNj432bobsEjv
         UJH0sNwI3o4BQrfrKrhZjAAgHQw5xVS5XDurT8jyZ8yA+ssgXdXrzlpZqEWNv6GxX/HM
         2R1HORBAYAdbz2whqjoZ2ECoBRMs03XFs3dLFo5vM40arjkw+EsHN/0QFWKOUnYP273a
         lGtB9qw9UuU99BzO7Z5samnmN2q4a2IzkIVunjKXf1No78mRU0OjIUb5QtLVb/oTSgob
         zWpw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVa65TziG2iL8mhM4D+5GzluiSoy6vuYIysFmPCqR34WNtl3q1g
	U7/mNipos29xm24XA5OVSVc=
X-Google-Smtp-Source: APXvYqyBNyHLEaDv8Z7xQbH3IhRrURIqk0mJraedHhuoaOFK1oMIHKibPbHyb1ASezPW+16VI79Zyg==
X-Received: by 2002:a5d:46d0:: with SMTP id g16mr33019208wrs.287.1577125817484;
        Mon, 23 Dec 2019 10:30:17 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6303:: with SMTP id i3ls4575981wru.13.gmail; Mon, 23 Dec
 2019 10:30:16 -0800 (PST)
X-Received: by 2002:a5d:6b03:: with SMTP id v3mr31615630wrw.289.1577125816468;
        Mon, 23 Dec 2019 10:30:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1577125816; cv=none;
        d=google.com; s=arc-20160816;
        b=mjjsoQ50yWZ6cxhnvCx9y9cUdK3Xt0fGdFjU9fsCbAKIXsFUzQBzqeQA2GtD3aDBMZ
         fPsVWRjqRLhhimy6tDgSUtfbzdbZcVzzUQ1z6KWCW7G34C9QAGq+tbt4OU2Prix1ve2B
         1LwirAZEZc3GBhEKWV1wgFL0AtxnjUA8R4d6t1iLVg7iQujBZVapMVZohzHtpMTcd2+9
         sGrOUFWjl6smifgD9VDuew8EXZLZ78CXjOYvy5n57cNe8nj+agDKQnqMgxj6f7vBiluw
         G8f2YyqMZPQvXHi58JF6nKd5jVEmpFf69lBv6xRXhQwa+JWL5SGehoii3fRbphE/3MMl
         vayw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=eeMssq1/HC854dPSpPTle678CuVu1i0F9KLPF9HJ1q4=;
        b=Z8h26QM/9qgan1kV09TYzgQPAe90g/HjUYPwKj7EBlvASk9kPIVqtVm2KeHYZRY5SZ
         dhJET9wjwF89Z5r5mLGj4+P37jrBG04cv+w8c1yjgYZ9v43zrDrz+eeYDUIJ2LUx4P6u
         NNGOSZWV5/mRAa6Lj3ApgGiGdVLhyAIFYd1Ox4QKGHHOtOoecWBj67xvazLZR1RzwltF
         n/T2C8oZE+BkBG5eKa6Kw3snznVj+OhZ5DltLkThISjD6gZ3ATDPPQar1JiBigVdtdPF
         IMzQ3+yDNZtCA1uftag0JD5DdYdUEoEmaG8r4U/OOa0bQZe2OJ19juK5kRF7rR1Dnulm
         siCQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=Mn7i9wIB;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.11])
        by gmr-mx.google.com with ESMTPS id w11si12781wmk.0.2019.12.23.10.30.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Dec 2019 10:30:16 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) client-ip=212.227.17.11;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.mchp.siemens.de ([84.61.93.39]) by smtp.web.de
 (mrweb103 [213.165.67.124]) with ESMTPSA (Nemesis) id
 0MGA7n-1iy4mG3p27-00FEQV for <jailhouse-dev@googlegroups.com>; Mon, 23 Dec
 2019 19:30:16 +0100
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 1/6] arm64: Document why spin_lock/unlock have memory barrier semantics
Date: Mon, 23 Dec 2019 19:29:44 +0100
Message-Id: <c16ed30bd64efc9d7a30745c333de9adc80b4a13.1577125789.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1577125789.git.jan.kiszka@web.de>
References: <cover.1577125789.git.jan.kiszka@web.de>
In-Reply-To: <cover.1577125789.git.jan.kiszka@web.de>
References: <cover.1577125789.git.jan.kiszka@web.de>
X-Provags-ID: V03:K1:Xv7UKAWDJK5LPe/P1UiPtW4lyqAZEEC/56zSCqkpDRzBNi/HLD8
 bHnhhYT8xaRkcDHdf5VHoksK8x/0gvhmtiu8DvWf4q7mKBSWtmBEsNrAk0vYB4crFisJV2+
 npKKuWJLHJrJZNAY0Vj5nKr1rgGVPiw4gzNLmPELPPrWAtqF0y2MLQ1LQaJctwT/vUQzvRW
 VtPdViyVIK52NXZSQczcQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:C9buUrX2xWs=:ZpJrQ96pOGizsFqLI9rOGL
 xxhfdsYr7o6whqyqgtxrSBhd9D29492dHaQwrufmzTYYrbYVyk1F2YIY9nAZpWEEgTK0DpwfS
 OVl74cbKN7NyTvibbMA/T7qQcxGLv/VrtqU0N/tmJ9HB2Z+DfLiwn8HsMDwmjF1kDNKzw6s9l
 e1K1gHupG+5/Te0ZUrsZQFUcZfLugzlRgZnCYchdzXBJhRQcfS7ZxC+Gw5w7bitBqwzZkfjQV
 etPoGU0OPfMSQY+xLZS+MsLmCVFxqbgInpe4Adg4b5sDbImNHkye1gX/G1eEEMXinYKU7j4nQ
 bOcTgxut5MGB8HQzN0VlW+COTo7M3Cz5WsxI+OtDILVdgpTpwvVAvwV7MHjOHZIu8z91MPtpm
 ZD1SL2Qf81bmC7EtdloiToUlGiEYZ/Q6XSlfbtJfbap3h8tlzAzGVdQj2bTqS1DRjbGkO1sYK
 L4dlg69KZ8C8DzO14Mx1Ak/YJ6OIxOzo//RANSkcdWueOzun18vJ8NPMiZ6zG+wo59rcyLeqX
 fs5Ir/MOe4gOzDMeoQvLE6ccD4yUH+MJLb42G6o4CpJTPggt/kt40cF/6eAj8XAOy2F6foPUV
 YSm8IBodksKmHWRVwwefrf92amLRI26pVFSf/gn2lHDoAcl8uME6QZX7UZGkqv3GZSFPNYF81
 fDiv8ByinfHeak9zrljZf/kyx90bqNL9g1KZYQpOJ23NlIQOoHwIyeVXqTzAcUAbJWZCTTWjV
 1Iu34kx3wElGExQTxTkicDwYxc0iuff7ObR295XRuto0ky4plyesre4rwLs0pJOX9BZbSwX76
 LCh8h0gFKSZGgQ2c77VyWebajCS9NiPJVloE8uodegqEuj2iWalvkaQybuP+f6LFGAoAsbdiq
 cO3unrrBjXzm3IOpkRd6WSLVzfR+h2xIBX6tW3tLSbOtO9z0pWFXqfY6xP22yJgic4gxPagB0
 zXhATlwXxygTb6/CUbfbGdTwFWvYXUICBkdUUvFTpCOvMYnvlMkoBveTmVhPt2aRTKJb7GH65
 Zg16m9+arLOlC1+WxIn7X432bwgRF4O4G6sCR4LjuLLcRv/X4TqVD4OiSwkZQDh1M1o1n+WRH
 i3Nac0dzsPrhSOHk7LZElLGjGgrcAJxe23p+VCmbHZNEO1OjREEM6iCC2RMZIixF3Qu12ZsnE
 S1DBeAKaOMvY57puklgJOZJqihGLwNAHNS9IBccKLCIZMWA7q5MzDy7BFW5BRGqleNfHlqRTx
 /ZLNGl8hhANpZRt1vQ9okzc17ttR80blhwpXJlQ==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=Mn7i9wIB;       spf=pass
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

This makes it clearer why we have no explicit memory barrier in the
spin_lock/unlock implementation, in contrast to the ARMv7 version.

Based on research by Peng Fan.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/include/asm/spinlock.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hypervisor/arch/arm64/include/asm/spinlock.h b/hypervisor/arch/arm64/include/asm/spinlock.h
index de814bc2..ac7063b7 100644
--- a/hypervisor/arch/arm64/include/asm/spinlock.h
+++ b/hypervisor/arch/arm64/include/asm/spinlock.h
@@ -30,6 +30,13 @@ typedef struct {
 	u16 next;
 } spinlock_t __attribute__((aligned(4)));

+/*
+ * According to ARMv8 DDI 0487D.a, B2-108:
+ * "The Load-Acquire, Load-AcquirePC, and Store-Release instructions
+ *  can remove the requirement to use the explicit DMB instruction."
+ *
+ *  So no need explicit memory_barrier bound with spin_lock/unlock
+ */
 static inline void spin_lock(spinlock_t *lock)
 {
 	unsigned int tmp;
@@ -61,6 +68,9 @@ static inline void spin_lock(spinlock_t *lock)
 	: "memory");
 }

+/*
+ * See spin_lock: This implementation implies a memory barrier.
+ */
 static inline void spin_unlock(spinlock_t *lock)
 {
 	asm volatile(
--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c16ed30bd64efc9d7a30745c333de9adc80b4a13.1577125789.git.jan.kiszka%40web.de.
