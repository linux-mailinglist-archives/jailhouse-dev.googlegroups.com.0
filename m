Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBOUPQTYAKGQERDPTZ3I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5C31299E9
	for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Dec 2019 19:30:18 +0100 (CET)
Received: by mail-lj1-x237.google.com with SMTP id o9sf458584ljc.6
        for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Dec 2019 10:30:18 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1577125818; cv=pass;
        d=google.com; s=arc-20160816;
        b=Q/wXd6jDpJxBR6cInlLPZYs+dhlWPwzKZFJ7efjN6wfTdmVbO2MHiOpf4bSsblxX/t
         SbngPCZj/dNvOy2U67A+BAxhSFMz9uoDgQPRBjdQFOHvwQB0Qj2p6DIezlzsYIv+pk6x
         kRisPWHrS7F4A+ByG0ThntnO4I4hBq5Dc5vkLTk+OGpEh5pcaTkgawqXGLh920ziYe4D
         w91FMG30chy7GT7p+Wg1AZt9Riz0zdvYTahGdfgegRONXvPC0o4rF1YVC0AnOH+QzEE7
         zYSRleC1g5P7MC6qxnsrsS5ZzRDQSgD0J8D2ASNX0J8e1iuXjJiAZg8EBYti+9++S/9i
         Z8fw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=AqcDcTRCxwcOSrFXvHtWeWLmfmdZTyNqiRWtu7wtggk=;
        b=eUciQonxuPeP4CGGBK8SWZOFOuUQtlxd3r8ov0NVv+baw3ut2XlVsB2YQcVEpyqCH2
         qPz7kc97hB+q9WqQiRo2O5pKHtp49vHkGIfdAzlnnoWdA+M4wPVEW0PKdgxms1bbEsX8
         T/QzoaP1LpXWvEpg0JH4lCPaSn0Bv8Dg+UhsohR0OVYrXKRmFZL09/TVMMPUl/+kPkBX
         8bozdeKShOHO0CKqyoyLoKfFtE12V+IpnnjR8p1qMtyDs60VKAucnoAlU2jREcmbVYUf
         bExyvbzD/FsHcGBNClckARxOKH0A8Lo0+VypitTT6rO6yaSiG0J3NYaBIpj8kvekfljN
         33aQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=iBXh4t9Q;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=AqcDcTRCxwcOSrFXvHtWeWLmfmdZTyNqiRWtu7wtggk=;
        b=MzYR1nUK3MIkd+C9n4UEdARbxa+wjlO1z/FcVInvhglbN+tKj5W0gVgAt5IvYccyQm
         cs+Ruxt6tWKPrsmIMzWN0LXpDh4qZm224IK9AIW2aagzavtLtgr5tFqt+lCHYk8/NglS
         aryrDGlCyjmvxNqnYvjQltlHpdwh9An+Pc2rqH7W0ZWWv2a94u6VVZFQFqAuv4cV9Ka2
         HxWa+1fglCQmC0+Kzv6XW2CGLdKt7OuR6P5qyFfwc5vY7eqglPG8SDh2qAy0LFJuzxVx
         5TaP7J3RFp+YGufB+hZ4isx1vg4E25NOVacElKKq9mClIp6s2fiVgtC1FY5T9qm3OJOb
         CJTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=AqcDcTRCxwcOSrFXvHtWeWLmfmdZTyNqiRWtu7wtggk=;
        b=PliTE4GFOG2jh2a1yV69FGFezLZ7ahhRsWPh1BqH4E4gAWhugzzuvGNvHfv7PH8lkg
         OfMftaA8r3MFNwK68ampMkOZK1PgYPjBIC8U/mHRg6qRBzrFHIvuNFdpjqMig3sXZL0e
         Gf8qbIdjsQF71hmcTxauPIyzWN1RrDjsAUTwY2efkJwkeiogsYvt+OIQGvKmZBdSPBQt
         J1giXJMLzBlqVP3/Rj5RLX/C2jpoZxRWOjO9JHG1onQDPOYUbQu8OU5DWwet3GCw7Qgy
         nXLruFle8WXnOhT2/kotXTa3DkGGjot/h4Nzxlt421m3HXq6s0cqNz2mCghKbMvPxVjR
         G6aw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXr3bgYR6SXMtFKomMkZ8+yatY4aftzbFCtcL4XxfCeRu2KlZac
	RK7C35RjdGSHL3MmleoJOh4=
X-Google-Smtp-Source: APXvYqwNDfxCm+QKlc0HbZt9gj7NFyJnSobMddtnKm178bIDl3vxeMjMJtmUqbZ4oVc/tbumYgNqTA==
X-Received: by 2002:a2e:8316:: with SMTP id a22mr19487733ljh.141.1577125818489;
        Mon, 23 Dec 2019 10:30:18 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:1608:: with SMTP id w8ls2081426ljd.5.gmail; Mon, 23 Dec
 2019 10:30:17 -0800 (PST)
X-Received: by 2002:a2e:93d5:: with SMTP id p21mr19461220ljh.50.1577125817066;
        Mon, 23 Dec 2019 10:30:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1577125817; cv=none;
        d=google.com; s=arc-20160816;
        b=I7jTzvP85fsA6jjHkGgLCik+OcIkDJ9UKPCEA5XEjwckHmNYHHyEMZdumJrMdSmZqm
         2UqG1U0b1432UPh6ijS0ju5i0f2ELdkffuWURHO81GteXdaWG4duxkE5g1W2zkskTqyl
         3IgONFiMKG3aIwtTQu26I88xxMPUcaG6pJPPvbZOKNL3RsL+RhfyvpXkUR821lKztwVf
         RmBJk7jmp1YzdtKh1vX/tAZoHQ3A77kSyDOx6+I6/taHMxPgmtsGBlMo7r5LiQneaWqY
         TaRDd3KS6z9xwREl1mzbPMrnKapd6vAs5EQY6bvdfjbs3dYjvdhRaTCsCBwFnZTd9JRE
         sRHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=69W0XUoAmbcnAfVs5CuNtITUyolwiHyLAr4GBpulqRw=;
        b=ey9lK8O+Yo7dwgNg6SsNVWCeJ/npXcko6y0Ww3xjstrgsxPEXNxijm2dJ0AWt1ckhC
         nWGXrXI+94ZTb+7ugqwG9DtJsuM6PK+fFQDoa/EY+epN//xxqb9gDI/e3gCHnZaIaevi
         rv73YLf5htAPIp91bs9HN/vKFDYeRlgYfubbTCUjLLQKXqYaDlObYDR1SBTi+kCtX0AA
         K1H9HDdWQmQ0fUOQGCz+Mwe2LizhAJYLGgqZyGnZ04MUpJ/cCrnOc/2xNb4sWsWW6/iz
         X8AN6BxVQLwJTGS3ByyDBMf2p45BwIJCjZdjNt3U5VkJWTSug+9DI0dtRQioACJb6ZuG
         xBHg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=iBXh4t9Q;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [217.72.192.78])
        by gmr-mx.google.com with ESMTPS id o24si978554lji.4.2019.12.23.10.30.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Dec 2019 10:30:17 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) client-ip=217.72.192.78;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.mchp.siemens.de ([84.61.93.39]) by smtp.web.de
 (mrweb103 [213.165.67.124]) with ESMTPSA (Nemesis) id
 0MfHk6-1j8Ibq17U2-00Okx4 for <jailhouse-dev@googlegroups.com>; Mon, 23 Dec
 2019 19:30:16 +0100
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 3/6] arm/arm64: Populate memory_load_barrier
Date: Mon, 23 Dec 2019 19:29:46 +0100
Message-Id: <0db943d9a2541f6a4539bd12377c778b1b6024d1.1577125789.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1577125789.git.jan.kiszka@web.de>
References: <cover.1577125789.git.jan.kiszka@web.de>
In-Reply-To: <cover.1577125789.git.jan.kiszka@web.de>
References: <cover.1577125789.git.jan.kiszka@web.de>
X-Provags-ID: V03:K1:V+cDI6WZnve4/kS1bz94FuS0FGGzJUhbcxIFaRTm4Qwj+xtzrEk
 INIgLeWRcFkpvW0k3hHTv+79elH4SPVwwlyNokDqNTTnmUS6Fzk5M1lf1as9cuAh3f8EYwb
 kHsa01247NA2Ob3zHPs8sjrzg2bzyNMSosALqS2sudnSRhhVZ4k2m4OYAKUp7SGa+nMk+aK
 garEeSwMLQ/mLrHz1Qv8A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:7oGk+9UylWU=:z4L8JcNlrNKxjC8NcqGklM
 c0pZgdeQ7j9o4nCgLtscLtZaL2ohuyv3nVMmiaGHiQ2g9TOg95t+Dwi2TtOeJhpBZ5sNc+anV
 +kcbVLF7aoOy6rb+GzjqKkl5N3HjcFu0Q5YKj/aLfVdtVXGnTSD+CxDHmh/d3d2qyFpqvhiqw
 IGeNZdAfHcit/MH7Q56InNJxT/2G0mZ9/ievMV+COmI/A5SNNoceNjekdvns5EnosRi6h/Dmw
 sCLCQeCZjc3izdVt4cv25HPTbAa1SXKBY4FIMV7wpIWW3gsxxVuqH3l6akDJQw2beY1NQYKgE
 bgc8nuyDHHRjH9eURGU4sDUCNZruzaQCliPHy5sP+979Z5vBDozBZs7PEpZZXXqoYmYFAIUK1
 walrW2Ga0C/N9KeYZE8f5f16amsDITjzZHZDpIaZ7rZvHGjyrOKC0e+AYHXkqZrr1thB9BOTQ
 +fwiyHfmBgp2svDzEFLiHcfSzHpVK8T8AOuwL/Ou44TnmU53YYEqomhRs8+FgC/rep0ODeGpQ
 il9xly+vRMGblZzwnr1oFm5ZbKYLVWwu8cr1csDZQbud2a2mt9ys1yUryMFJOBFdW2jw9xrol
 RU0tDJGA943jnNeLPkn8uZN6ayyDhSrT7TZrj/a8mG5vFNND6zinkdDPkuQnrJE4Kkn695bbt
 Gp9IgzWqMkl/32x/GSuJ5mlZ9XZu6Dspq3MjVkvIrFphwsNVmRnK+kx6QlBVeO2ZPwK78yrRS
 T/jO85qocNP9GArs6waItehv71gz6P1M5pL1iIvvRFYms3LTNPVD93cKCcgLEXUHAW7/6yHtf
 8e/C4NvR3PepR9DPSL1TLPTTRzDV4blsvTytppdmQqa2UMYqkt60QKWKiBU856P+L9oXueGzi
 iQELx9AnGqFvbO8JCr65ZG0ixtus2hYFmVoDMQrxe261kG9lc2KIKPsFXU6Wac0E7SONtMvxe
 kXC6UWrM7F1rqpr9k3zflNOFcjHeqi3/x5gVO/6BXprVcZdKJlpuDv4nhiKksyEXUwdoIyLpw
 BO7pC939dRHC9GpTZVTnwYeBHnxwkRv4bM+/eCt6cliAp2h14KT0/BPdDtUOCtpM59jW5Snkz
 44hTyTJX47NSPmPedDSxNgjJFVHRjPH6ZOCXJV+xmVP9QbXU09eteP4+wTu1DhfCTvbb2++uX
 L5rr1lX7FOG/Sz8Veo3d6J1pNJAYq/LXUhrKgxLACGj4eyp/Bf5uMxMFXzdnx6LkpWB1Imq83
 2G1FCavXiHI8Vg6O3hIlwjD/n7MuvVIbtRRWrFA==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=iBXh4t9Q;       spf=pass
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

This abstraction is currently used for mmio region updates. There is no
reason why it could be left empty on ARM. Linux does not do that as
well.

What Linux also does is to map a write barrier on ishst. However,
Jailhouse has no abstraction for write-only barriers, thus cannot use
this mapping for its generic memory_barrier.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm/include/asm/processor.h   | 1 +
 hypervisor/arch/arm64/include/asm/processor.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/hypervisor/arch/arm/include/asm/processor.h b/hypervisor/arch/arm/include/asm/processor.h
index e5af7921..79b66f39 100644
--- a/hypervisor/arch/arm/include/asm/processor.h
+++ b/hypervisor/arch/arm/include/asm/processor.h
@@ -57,6 +57,7 @@ static inline void memory_barrier(void)

 static inline void memory_load_barrier(void)
 {
+	dmb(ish);
 }

 static inline bool is_el2(void)
diff --git a/hypervisor/arch/arm64/include/asm/processor.h b/hypervisor/arch/arm64/include/asm/processor.h
index d2c8101c..b52782b7 100644
--- a/hypervisor/arch/arm64/include/asm/processor.h
+++ b/hypervisor/arch/arm64/include/asm/processor.h
@@ -52,6 +52,7 @@ static inline void memory_barrier(void)

 static inline void memory_load_barrier(void)
 {
+	dmb(ish);
 }

 #endif /* !__ASSEMBLY__ */
--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0db943d9a2541f6a4539bd12377c778b1b6024d1.1577125789.git.jan.kiszka%40web.de.
