Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBLWSUH5QKGQEX53JSHY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A044271E54
	for <lists+jailhouse-dev@lfdr.de>; Mon, 21 Sep 2020 10:49:51 +0200 (CEST)
Received: by mail-lf1-x139.google.com with SMTP id 140sf2289833lfk.16
        for <lists+jailhouse-dev@lfdr.de>; Mon, 21 Sep 2020 01:49:51 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1600678190; cv=pass;
        d=google.com; s=arc-20160816;
        b=Q6uajaqWv+sUnq8D4y8eqgv9/PkF8HkkkPGmtYuyBy/mEcf0nptDNElJKTzpLq7EZp
         A0Azt4Ov7AVRhQTZjcLkgvuoo5QySBtZh/I6twlNxFGP2g1Gi611NVhPHg5moVAUpc/f
         2Df0igeGL1YJfdhsCUpm1W+08fQ1Ywt4z+gktnrHszllLzkSi7VuV0cHSUpqiLPkJKNM
         ZKbm2wD14UsfgHwe/LLXwj7zeJooNPKlFzIJ3eX/411ovTMRI5c4AUX5MA7nrP8mL2uG
         cWyq5cFahL7FwniHwj7DyETLjSwvHMuEJ2OHRCA6rBZ7pTKT5+SDLsE4GFjn5hDFhgir
         i9Zw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:mime-version:user-agent:date:message-id:to:subject
         :from:sender:dkim-signature;
        bh=jATP0r+CKJvt6mgvvqDKQCrdFYVeBO+JOReMXvuj2Ao=;
        b=ShB4xNX3HHGg04kKR5LX5bzVw89s5Z1NLZNgxx7w3vUTRkqCssWDgnCmSKl8aRha97
         C3FwwtNTQXhWDCH4GNaw5Svj6BaCEX7WhDPyh8fJ/OpL2gmsaFF/M+Nc3Axn2NZB4n2y
         FHkWPFzSgIQroRlsUKhk7ovElJ1cXXi11O9ENVp+G/YSbsrqHRkjR6gSbgoeYprTSzLZ
         HbxRmLWlVL2pK7iPO2bL/dYzT8XNkOaRYKFWKUXqD6U0ZmPlzU1LZc9i1Zqgk+ceM3yB
         kEgJ2ablghijjywXp4CvhODDL4M8DIHbGtcaqqhho9xOlERCxGbjX+Ajs6pp/EPQ9T/1
         z8xw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=jATP0r+CKJvt6mgvvqDKQCrdFYVeBO+JOReMXvuj2Ao=;
        b=YdQJL8fozr8fSV4THuG0BqRN8aU8EHv7Ky4jms0vEBh/1J92wx+2kt30i3DBOtAn4O
         BwD1R3z5hGD4SC5fn7jDwyMbL6HqvixV0qjbQ4gGkkbr5VZHo0rQW0oA+M4hWpH3Izdk
         SDUOfvorTSbn0jVxBEEvRTWPsyDYna34w36BuH3+/D1pra0L7GJOXKdtS9mDqM1HWzRr
         pF/X6ZGGVlPg6e3Y5f3AwW/g0yxY6LkgLCCI9cHiU8bkMc4biMFjZOle6mBVzvfXkE4j
         6GlvKNbss/g8ITdzxZoivE3+Lm6zZeETUYV/Nu0SHo20EXUvth34WPMAkvJQqzS5vuzz
         egzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=jATP0r+CKJvt6mgvvqDKQCrdFYVeBO+JOReMXvuj2Ao=;
        b=UzsbhcDQ5mmYl3QFbd3WTtvIn2l/SbIKySJoJUFbxp8suj9fnGJbi9lGkkryBUif4W
         zY+3GF7njj69Adl0eMAhkKBGiiDrCYSElYFGqwp2zuE5kwDVmW6UlEIHT5E2LRrFQXEF
         pWkvavEqEUod+236PfAZsyqTBXmYyeaiG/PSXtJLSxf9KzSXK9hdUzOboG7wNZGLoFQo
         jPK3SiJ26bBegRh55BLcC0GxsN6JqfSLlCa6e453frCxTyJGtQ/HyB4q1/4oMd471dO8
         6ylS3WFcWZGjcLw+g/CJAmnlrJ4Q3BMzlheq545SUJ4Y9yibkLY0OpSm3GrDeFH80mxa
         Z2Mg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM53123nohd6F6DNB2VeJo+lWsetl54Tbpa9V7W3u7FfCaoaZH67dP
	cRKb2RpqGYDLo7AoStYRlz4=
X-Google-Smtp-Source: ABdhPJyg6HXUW/WRceUoBCVERrUvdTo6aF+ftHb/5f3IMn0EGkqZ60ULSLfkSSCrFooYJoInyfD/3A==
X-Received: by 2002:a19:cb96:: with SMTP id b144mr16879295lfg.143.1600678190668;
        Mon, 21 Sep 2020 01:49:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:544e:: with SMTP id d14ls1125843lfn.2.gmail; Mon, 21 Sep
 2020 01:49:49 -0700 (PDT)
X-Received: by 2002:a19:9cf:: with SMTP id 198mr16793541lfj.214.1600678189358;
        Mon, 21 Sep 2020 01:49:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600678189; cv=none;
        d=google.com; s=arc-20160816;
        b=bWPOxfr9ldAoFZimZsMKiJOOxIDdXyIBN7HenjZ05uKYN84SKJnOEKddtryw/10trO
         L/bQFxTURBAeQpL7r0ie80Lyq/8vnAaOwwe5DZ028bCdGn2HzbXRDLuI/PKhPvHWVFYw
         0csDys9cpIJi5IP4FqMosH8Mc/zdFdlYIpVC9N7QwXktvpkb0qGCRGEQE8qJ5oUKle1T
         cyk3LRRM7LqB8bGgu6V1NW74CjKSPcesIqeDqzUkms0TNjDpf+lonshuWGpfcC91PApv
         Nlxpo0HPgWI1Ije+Ej05oDCgoN4nd0k6GeGW8aDPjO2KCQo1GQ8hnGY9lct/r/PWLVH5
         lwkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:to:subject:from;
        bh=t53YwlQ9DukOYpXxUPaSt1gAXFqEUd5djPQOYC7BTNs=;
        b=hI5DiZUanfzdlWWTp7oeEjLZFtv/B/3itLoIOXh1FlNd33hiEiJipfw4r+vTTic8tw
         OBfYT1HBViQcN4bhrokqr5Qqv/So4RaSGWNkTwJLWfBORIgKT6QDHrR1k0U8uSiHOfQ2
         BUmmwVViPoYkPoWWxwR11Yko+V0OUICTjjo/Y3kQMRnxPrOdW2m/CMMWV9JY2HRiWr3u
         O/BaHf/eKzahiGncu/2JdbQjC4lFB5B3xRyeuJrTdYCYD2jk2N7gKe2u/cPvo+6ZGWK8
         aF8sFQseH6J6NQgPpL3yvoBwO7ESL7h58nYP8ATcnJpunivKM414utJ4WpBN6Y5RGpcn
         591g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id f12si370502lfs.1.2020.09.21.01.49.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Sep 2020 01:49:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 08L8nmh7030121
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 21 Sep 2020 10:49:48 +0200
Received: from [167.87.4.147] ([167.87.4.147])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 08L8nke4022967
	for <jailhouse-dev@googlegroups.com>; Mon, 21 Sep 2020 10:49:47 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH] arm: Drop sp from clobber list
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-ID: <53235704-e0d1-3cc8-d29d-a993a3c5995d@siemens.com>
Date: Mon, 21 Sep 2020 10:49:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

This gives

  warning: listing the stack pointer register =E2=80=98sp=E2=80=99 in a clo=
bber list is deprecated
  note: the value of the stack pointer after an =E2=80=98asm=E2=80=99 state=
ment must be the same as it was before the statement

with gcc 9. Obviously, this cannot be fulfilled in the given case as it
is one of the purposes of the assembly block. But as there is no code
after it anyway, it's safe to drop sp from the clobbering list.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm/mmu_hyp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hypervisor/arch/arm/mmu_hyp.c b/hypervisor/arch/arm/mmu_hyp.c
index 1fcebef5..8a897f2b 100644
--- a/hypervisor/arch/arm/mmu_hyp.c
+++ b/hypervisor/arch/arm/mmu_hyp.c
@@ -199,7 +199,7 @@ setup_mmu_el2(unsigned long phys_cpu_data, phys2virt_t =
phys2virt, u64 ttbr)
 		"bx	r0\n\t"
 		: : "r" (LOCAL_CPU_BASE - phys_cpu_data),
 		    "r" (phys2virt)
-		: "cc", "r0", "r1", "r2", "r3", "lr", "sp");
+		: "cc", "r0", "r1", "r2", "r3", "lr");
 }
=20
 /*
--=20
2.26.2

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/53235704-e0d1-3cc8-d29d-a993a3c5995d%40siemens.com.
