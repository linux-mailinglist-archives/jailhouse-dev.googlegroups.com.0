Return-Path: <jailhouse-dev+bncBDOKTXXSZADRBWVKRCDAMGQE4XPFSSA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x63d.google.com (mail-pl1-x63d.google.com [IPv6:2607:f8b0:4864:20::63d])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEBE3A2D2F
	for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Jun 2021 15:36:28 +0200 (CEST)
Received: by mail-pl1-x63d.google.com with SMTP id p7-20020a170902e747b02900ef00d14127sf1075284plf.23
        for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Jun 2021 06:36:28 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1623332187; cv=pass;
        d=google.com; s=arc-20160816;
        b=f6PRF2LZNDrnCrP6EQkuNxvmuym48MJjIONTa0WWbe9968UahHR1MquRXTNSWNWaXb
         K7hk4XohuwZeFICiWzgxKIDjljRYlcoXRbO7C+6CIzuTuNSXGmNDwC9zWNyPyxEqjA7b
         A3steUqT7BVTSD1mI5dgWvh/ow7mwArLUgxwvtcDlppKXcFxQVMbk80NBxr6WoS7d5QY
         13hgu/etN1Qhn1FpwGEwFBbl7qL0QnsowZie3eptgaSlzjTm3lI7bR9Q8OqXxIdLTSUa
         wWIIuuHd4hAqzVnLYNXwvzaKZ4mRGikRbT5KxuSBnL88wHvLvL5KIpvuBVz48X0L+jT1
         SthA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:message-id:date:subject:cc:to:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=oJKrDVpDL90qEZ+vfraVxkrtyhZ1IE68cous9s91j1g=;
        b=C6+bIsjs7MwHjC7Evi7Fbb68EsytOsAzWg+mieklDVFMEHmqCp20tjMRo8j+hX9Q3n
         2wL/YlJ9RU83xfKj4evWyVhDlBgBz3AJ5G/G2mkfOvOaybJQzSiljyN6CnimmHcUnRxE
         UoLU+lfsVs2194PZ/yydrsE9seTcGZedeY1iTPPncCjbHCYnfyzI7uO9WIHpf15B+zP/
         EqPlYwBCGBg/hXzcdq6LIsyiloT9LwJxnPEWem10j5XeCHXHFGY9w3qY35RmTv3MR3m9
         vKXVMLUKALW9xbT7MVR/n/6hMLXcmejHmMc8yt/ziqgpoUm8nPF+sKFtgqWaHwtgUliL
         J4Cg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=J+MDKBmw;
       spf=pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::644 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:cc:subject:date:message-id
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=oJKrDVpDL90qEZ+vfraVxkrtyhZ1IE68cous9s91j1g=;
        b=DKH3Km4PhVHtPVFoSkbWJ47VUyb1W1IfA+s7kkg1kju6uissNzgItCweoifofoq8ml
         7hwZiz4lkh/7wHcT/LFtwe/mCZXyVbVOgb/Z3neQlA/VyC3oH/7CzR4zib5dIi3sJA07
         NH12ypT5FCLoSg4NxKKfjJA/ONVheSaiXa3ZELDK3OSh9RzfM4pTaVi0g3yGp76OQD5R
         WCJjI3ryFxp7oc885C6MeDjGmHUyvVE2YoH70+7Eg9DMIJulXfemN5unKiw392ECok1n
         1pT1Ca65CK6YNlpF9PwoFTr0Fv35psGPXAK0VHsZsIHpyuJ7cxAkWVl6J4aX+Dr9IS7u
         1XmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:to:cc:subject:date:message-id:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=oJKrDVpDL90qEZ+vfraVxkrtyhZ1IE68cous9s91j1g=;
        b=oTzrMajxNtOD+rucHhTeePhW6k8L3GFnHr5mwZ3C0UoZh62PfpXeSk9JGysbH+rGrk
         /KObvxcQofDN+cbvuuYr7zzf9iA6wLCRru3/nBucU18TwM7k8VjlMILGeSLhqS250jC9
         20qNUHOjVZmLXkazQuCo0dE8vZ7w00PIJeNqh2weXAmUrmk7LMSKRiNsfXPBCOv4GHFY
         OdBaaky+zK5vOA0o4KSlN5HwnAWAk1gdGLcf2wUSVAA6wfUPQWDUE0vcCqFPm5+eVobE
         Jro+HBbv35HuQsmlIAmTb1/gFz3M3LP1gisqaa8I5B0r1LyuI/2FDKmdl5ZSr/l6Q5yb
         7iDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:cc:subject:date
         :message-id:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=oJKrDVpDL90qEZ+vfraVxkrtyhZ1IE68cous9s91j1g=;
        b=jJoUn6MvvzDRTSR8gFb/t8lzPaWxTLTjRtIzmQ/y8VVTxFNpLqprMdnOJyjHh8EWtF
         1Xc0UI2gujq8Wr6siBGOVYxyIrIkr2NhFnmMahqMfl1G7BwLVF94blgR30wDL/IhrGJG
         qpuewcroPVqwVJJVPrrTi9mCaL8WgFNvrKoXadX48FKtwTCC9SBkYkGgzsm4GvDWhEDp
         j+CrWIhoiw75HGcnWmiaHafAzvXvoqcEKfJJxdkhh8usjwuQtKLYZLiWkf3+OxLmYOY2
         +kNvE9HIzVmLMKfHLMtyqcMJmYoeXA/tEZRt+BaKELhs1/jDk3CSl1H1muK9wIF3bDb/
         h6RA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533T1q06DEM70m/C5vKYWVBFwUZnKOIkeUNWKsb2YGKfT+uS/ci5
	j/OyP80x878sYPUSama7+AY=
X-Google-Smtp-Source: ABdhPJzROxMelPsqgWfWb5eNzLJpLZ0CuTQPpE01j6ISGpoLOvHhl77A0RzF6uw/n2+eQCH1b5tL0A==
X-Received: by 2002:a17:90a:f3d0:: with SMTP id ha16mr3492266pjb.123.1623332186844;
        Thu, 10 Jun 2021 06:36:26 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a62:fb0e:: with SMTP id x14ls3038264pfm.10.gmail; Thu, 10
 Jun 2021 06:36:26 -0700 (PDT)
X-Received: by 2002:aa7:92c6:0:b029:2f1:3fbb:3171 with SMTP id k6-20020aa792c60000b02902f13fbb3171mr3176143pfa.0.1623332186311;
        Thu, 10 Jun 2021 06:36:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623332186; cv=none;
        d=google.com; s=arc-20160816;
        b=FAT6m6nn7I8VVLSZaMgYkRt5xTGnxBfUBaZyjyEM+wlG0pbGyg/BQhG9HsFbkPoauZ
         CmBjj2ojglTnSDXF5TmXqY1W1gmdnwdaTJC6hT+MipmbRzyHM4WUP/MUPYVVpn1xMYzn
         VdoF4YVeHGm43IcHIv0I33/XPYzok794WaRFSfq7qMwjbeOD2pJ7fdWSdYLz/5Or53aC
         aUOH39LafFuwyzxq/Mmr/MROcz1tkVn1qsFptJQqLIaBw5Ofg0stMJdUlSEq8Cr2jEBz
         P47iThZEmDFmV7E9YyGyWeqzi/i30ok9q8wv9+wl8fOO2jb5OXkITnU0Gb+iOPkXf0Ju
         6kXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:date:subject:cc:to:from:dkim-signature;
        bh=IZVb5lTcYvcZuNjIA3Y6ZNzAxDczrDFv7Cq89ydB7ag=;
        b=oMl61Mp3uv6FDdpjS7QMj7qDioSGnaKAZpAx2MHmLjx1CtXpDdkifq4plsdZqVvTAi
         mUq91nucmu9llRNiEd+hjxq7Ckw4duVicl9oIyPbkgtC/U74+xGMIQHSaF0s+JJMVAnM
         6c7+wYvHN7srRc0yb3/suYTPv9xjcnwKpLOXgoPIldwsVsLkslTUQcbMDzfeZUU1Uksx
         ph2eWXog6T+4DLLcLkySgeiHknV1U7mdGz5iCtlxtJNb92s8pgDeQVrPrZjQQWbHJFMk
         ahJZ9CTzY21O9RXBAxFC7wYCOPnefuKr2VGUNiDowKzTsf3PbpZBiC4JWi7o+q4J9S+r
         i5xw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=J+MDKBmw;
       spf=pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::644 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com. [2607:f8b0:4864:20::644])
        by gmr-mx.google.com with ESMTPS id ob7si273117pjb.1.2021.06.10.06.36.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jun 2021 06:36:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::644 as permitted sender) client-ip=2607:f8b0:4864:20::644;
Received: by mail-pl1-x644.google.com with SMTP id v13so1025784ple.9
        for <jailhouse-dev@googlegroups.com>; Thu, 10 Jun 2021 06:36:26 -0700 (PDT)
X-Received: by 2002:a17:902:a3c3:b029:f0:b297:7778 with SMTP id q3-20020a170902a3c3b02900f0b2977778mr5078624plb.16.1623332185999;
        Thu, 10 Jun 2021 06:36:25 -0700 (PDT)
Received: from localhost.localdomain ([47.89.83.12])
        by smtp.gmail.com with ESMTPSA id b15sm2506451pfi.100.2021.06.10.06.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 06:36:25 -0700 (PDT)
From: Dongjiu Geng <gengdongjiu1@gmail.com>
To: jan.kiszka@web.de,
	jailhouse-dev@googlegroups.com
Cc: gengdongjiu1@gmail.com
Subject: [PATCH] arm64: Do not dynamically enable private per-CPU address
Date: Thu, 10 Jun 2021 13:36:21 +0000
Message-Id: <20210610133621.31470-1-gengdongjiu1@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Original-Sender: gengdongjiu1@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=J+MDKBmw;       spf=pass
 (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::644
 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

In order to safe, forbid other CPUs to access per-CPU private
address when it exits from VM.

Signed-off-by: Dongjiu Geng <gengdongjiu1@gmail.com>
---
 hypervisor/arch/arm64/setup.c | 2 +-
 hypervisor/arch/arm64/traps.c | 6 ++----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/hypervisor/arch/arm64/setup.c b/hypervisor/arch/arm64/setup.c
index 376648e3..82da01ea 100644
--- a/hypervisor/arch/arm64/setup.c
+++ b/hypervisor/arch/arm64/setup.c
@@ -143,7 +143,7 @@ void arch_shutdown_self(struct per_cpu *cpu_data)
 		:: "r" (hypervisor_header.arm_linux_hyp_vectors));
 
 	/* Return to EL1 */
-	shutdown_func((struct per_cpu *)paging_hvirt2phys(cpu_data));
+	shutdown_func((struct per_cpu *)paging_hvirt2phys(per_cpu(this_cpu_id())));
 }
 
 void arch_cpu_restore(unsigned int cpu_id, int return_code)
diff --git a/hypervisor/arch/arm64/traps.c b/hypervisor/arch/arm64/traps.c
index 488dd7f8..95d8d860 100644
--- a/hypervisor/arch/arm64/traps.c
+++ b/hypervisor/arch/arm64/traps.c
@@ -43,10 +43,8 @@ static enum trap_return handle_hvc(struct trap_context *ctx)
 
 	regs[0] = hypercall(code, regs[1], regs[2]);
 
-	if (code == JAILHOUSE_HC_DISABLE && regs[0] == 0) {
-		paging_map_all_per_cpu(this_cpu_id(), true);
-		arch_shutdown_self(per_cpu(this_cpu_id()));
-	}
+	if (code == JAILHOUSE_HC_DISABLE && regs[0] == 0)
+		arch_shutdown_self((struct per_cpu *)LOCAL_CPU_BASE);
 
 	return TRAP_HANDLED;
 }
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210610133621.31470-1-gengdongjiu1%40gmail.com.
