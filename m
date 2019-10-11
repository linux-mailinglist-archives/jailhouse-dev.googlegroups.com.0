Return-Path: <jailhouse-dev+bncBDRKPIXWWIFBBS4IQLWQKGQERRYYQEI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id 19865D414A
	for <lists+jailhouse-dev@lfdr.de>; Fri, 11 Oct 2019 15:31:56 +0200 (CEST)
Received: by mail-wr1-x43e.google.com with SMTP id z1sf4344386wrw.21
        for <lists+jailhouse-dev@lfdr.de>; Fri, 11 Oct 2019 06:31:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570800715; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZnOrBOlQVTV3sPh5/D3F8GcB6bgL8dZ8JTcF2nRUhVwhY7L5rC0ASXmctdlQMGB5Ei
         rMP0XBcqSguvm1UtXFkUaD03cArKhllfbRC9O38sfAMPNZuu00T+y8csfRUauRptbJz/
         9Dkqb0fMiHKoqGd24zm6YAd4iHUPqgZdE407N4XymmczAoEWeC9PwWB4AlNaQDVMaXOp
         z8fsBxeS0EEtQXNK7KVXqB2fw9R4tJZqek7TcqLa1Xz4/7hr4aYIa4J7I7+vovD4YpHz
         uNDCrelLJfgpijVJW9HGzNBq15QKI+kOkYrECpIE0Vqdb+nyKbScK2OZJwxJIOfrK4AJ
         GFtA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:date:message-id:subject
         :mime-version:content-transfer-encoding:from:sender:dkim-signature;
        bh=C+rt+1zV3r1AjIkm4gzBuooEiVND9H+MXOMiTxjbLVw=;
        b=nqfprjMrPDKxpYLC+l87Y9PBgCKFfFPeU1AvSkJbH3lGfczKFNoNdFK507tLYjhIUI
         YAL3/kxbhBlJ5VPG0zJnL0a4dXI1GK7AmE0k/XZ7Xt+tY1sr5ROV3n1fIK6TTS2VhgKv
         UkvcEh/TAVlRzM/snzvj9wVPM0H7gSFqr9L4FD640zjqa04BGbQYEsmHgYHFJzH9roRF
         bSDLPtJIvJ2LiOI31infC8HzEfzAB55kieC7qUxb0Il5ea7Xpe2mlZ10TL+8FoKr/mBC
         CA9fqBBf7WAdo58Y6I1kc5FlD63KZBvJ/s714P1vXl/XI3eliIs0J1YuTOXg99o6D4lM
         JyRA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=enUSoQON;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.17.22 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:content-transfer-encoding:mime-version:subject
         :message-id:date:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=C+rt+1zV3r1AjIkm4gzBuooEiVND9H+MXOMiTxjbLVw=;
        b=kWUbgpMXEFFlMJDd0h5c31oJ4oGdDVfgp6ACLb8ihMIJHFrYZodho6o/FAyYd6OwV0
         WHZnzX6cSnSa28BX6xmzqsQbKr6+mWb9OMwws/IDS7+dYjXkVASoG5/nM2YnjREFC74S
         gnWtJBnkdF8wSZSEBnbmJn02D8zqhfJfqaS6xciqqbAhPAVAoDyk2iPGDk8mXGNS8jym
         4yq9rMm3zRpj7+kQPa7NQkCtdpFR6hLNoGzycBWooQH/KtvPaIhBOK/+Ty37Kj8gNXP9
         Q5vGf0FG8L7lPMFKSaMwqQjkZBUxJWruXvICcS3mPiD2PQ2fL6Yst0yf7Z6PP+HneLxd
         w7Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:content-transfer-encoding
         :mime-version:subject:message-id:date:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=C+rt+1zV3r1AjIkm4gzBuooEiVND9H+MXOMiTxjbLVw=;
        b=FpOax5Unu51ZwGxtbV/Ae2rkbBoXacAlA33kAcst7Mxz8047Ehp4fEtqGOBP4+kapr
         jG82FSIFhReLh8rPRkaSnx0rI7JwL0bHC3MynfpJBGF5dZNNF/FdPOmUad3BB6vkj6tt
         SQWvesCyE9pw/HpUtKoBFn2dTD1L9cj8H0icLF0tiSAWtrEw27L920gxwLjztIOTQRRc
         cj1zjz/L66ESLFx6/nhKoHwn+H+pqXaZ+u3laqlm5PxcMCMZt4nuwTc3du3zqqPmACHs
         5MWQVDCPMdVOmgVZVXlCYEiV+F77mF2mDxg7RrzGJbSxHQbXMv1cYsC/jJ0rKGek3uTv
         s0+w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVDS0dSXgWbslglhj7eP4yYR1n6BAQZWksdhtVBCHlXESF3/wAq
	dVe/4DRAGmOh0bxugD3YTp4=
X-Google-Smtp-Source: APXvYqwVUAFNo6GCCpshbor9zlpvArbQIWyBUosrLqyZsFeLTZmOSm5emVgFR4O6jClqqtPZUB2KGg==
X-Received: by 2002:a7b:ce12:: with SMTP id m18mr3251824wmc.108.1570800715794;
        Fri, 11 Oct 2019 06:31:55 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:fe43:: with SMTP id m3ls2623905wrs.4.gmail; Fri, 11 Oct
 2019 06:31:55 -0700 (PDT)
X-Received: by 2002:a5d:4a87:: with SMTP id o7mr13833767wrq.374.1570800715108;
        Fri, 11 Oct 2019 06:31:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570800715; cv=none;
        d=google.com; s=arc-20160816;
        b=zoJT+o7wR3E4ou+kQBz7NFasGOAWeRBa5DnUffvx763T7xbAPDJldgFMk3JYByO0Fp
         NxYP/HV/P1RLfs49bJg3IG/izG4P2i24k1O0iM9GHGRbufVHaJ26hpv0bIDEXL34sdUE
         e8TPL6+q0S+xWmDQ974p+1f+TpsowMNB9qhzqeKQiQvPLmzDmeKkK0wQoY0xbfMzZaTG
         1ZykvD5xqbROm2zQjIHw/J5oPm3LTRFLKz7aR2IEzYJWa4DZFgsl2MTe3ipM3gTv6nEv
         mtb9CaPqZ4i3QaBAE14I1ZLijhX7NQXy9KaHd44UBm2NDd0EOGOkrM6JSk+yKvWGmksp
         Mzvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:dkim-signature;
        bh=nyvkAVkf1MFtTOmXL4bDHLUQAu+kWmtRIoWdGzk83OI=;
        b=zBp4vHaSThyuOpZc/w4LrRkx2rtRB933XvSylDHkgtNNVZE3X84u3LbOigNsN6OrkZ
         7MYW0ElLYTOCrej544CL9oZBnhfAB01R0EmLlaWS4qUw3PSL8eVwMVMDsECoZ/dp9jjV
         Km4+/zcDeA03Vp7BaL6UvpUIt5ooB4OJnm6sNqd5cbLmNwYR1/YMkjD6toIyaY1DoXZY
         uUdtEfQvAwv1F2Agc2NKxE8JkJye3Zh/JN2UJvNenHz9Z+F50kRZ1vN6sAEGL4gwB4fX
         IUBPGOztAmCrnD3ieGPo3ELK7F74DZ4eu+ncCTbLSnbKZhNzga0LvkVFSPmyIlvkR7RJ
         KpMw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=enUSoQON;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.17.22 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
Received: from mout.gmx.net (mout.gmx.net. [212.227.17.22])
        by gmr-mx.google.com with ESMTPS id u15si492955wmc.1.2019.10.11.06.31.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Oct 2019 06:31:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.17.22 as permitted sender) client-ip=212.227.17.22;
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [10.0.0.213] ([212.126.163.234]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N0XD2-1i6lQc2ZUK-00wX07 for
 <jailhouse-dev@googlegroups.com>; Fri, 11 Oct 2019 15:31:54 +0200
From: Oliver Schwartz <Oliver.Schwartz@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: [PATCH 3/3] hypervisor: Conditionally forward SiP calls to ARM
 trusted firmware
Message-Id: <CDEDE05F-D9F9-4CA1-A736-2A39CA63256F@gmx.de>
Date: Fri, 11 Oct 2019 15:31:54 +0200
To: jailhouse-dev@googlegroups.com
X-Mailer: Apple Mail (2.3445.9.1)
X-Provags-ID: V03:K1:8yb2EEIDgqA6arcqpssY3Tx1e+Hnvh8dMHn6lrtSJMSCU22Z1yy
 PTTCSXQnDtbskICE2HVCR2fXtq3QlyHdBc2qEUXDEydHG+mlMUH0sY51a/hYhGCPpiUHY34
 +/Lx2ecLvtNJfRasW+gSbSazxRcIjz2VQNkJ4QC0e58QLFKKe35Y1oaoHtMrWqqIMM0lF8h
 +0QNo39FXZ9/JDo6kOHaA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:SJnr+YLKQtc=:tPuELxRNpTfbRLS8w2UEly
 NcZ/cASuT/ynkxwW7zRndQJdRFNR+iHctObnq79hrdIsJJ+1tkX6VexGubddGHtzXYVM8MFEF
 p8u4Vw+FT5nz3WcSwvzdpliTzskGMBhxkEhSo1tcm9jV0YpwybT3pJVmp8aeB6SRxt7TxLSB7
 yCcP/CpRHPwp9U/0Gv6adIZFnsjhtCJeWo6/dh3ZygNVr1OTMlHrHuWpmP2+M0nMR5nrzgVY+
 ErVObNi91DrpDe+F6+ymRPHz51tyH8sg2vtI9RXgtmN+i458Kxx422FUc5wlfl+bEvESlV9y/
 jmFSPpIZy0rNdU0k3GkVOXnP5/JlTYnJs40U5WcUV4BkKTxqzFEv+CTvyRVBox6iBQLbdsqq/
 TeZWu5+rbDvuVY1uGMUaz/hnnAw8VklFse5VeAlQ8m42JmFvzyY3D0ZnS7/+PER3BT2Fc0PGH
 x+Tp01X6b5J//g1OwPvDG2jHHTis5NKpaVZUSqNnwmGA7YUNf4Rrijjtvc71ajddXa2CM8A0P
 FhwcjcDuj3iGn8gTxMO0Ijaq/RzrZNQBWnzJ8l0dwcZ+CoRBMW1gn0lqs56WVtPIkTyhwQBb5
 EEMgnaftu/GjbZ77qkWwjRDjzwnEvOYhA5TmJ1wkqRw3gu9SsMvW81/jS6FlPOsshpE74RLj4
 dNYQdGaVGMKhi0cQeKhpNvK2JFf0+2FdRhB0lmmqciLiirXaH420jD6O/WyLsc4GY6BWZ/1AS
 Qy98DnxB1mmAZJ/CQesEVwyZ7hKHkLXkgoWdFBmaVTjQCdlkgJlwJAzjb2pRRGqG4FRh3CmyS
 4zLiarB/xfsx3bHisNSv3xaOXCXasv+JyQDXCu1ZZWwRlYKfEXetbZIVnBUR/himi4sLHkFol
 7N0MW5x1ZkjMUILmH5eGkFQmVtqppT6/RWR3IJHMhnCr7qTXkcywcV+X9og2c4+SPjAGQpMfM
 eEFUa+ZKlr+Kh/Jss+e7JfUpyDjFhPZb+VzEtrqzMQmN2AZLot2qqUFFAn1lbQG4RLLuBL1GE
 XiOPdVjWPyGzRlWi1prQHzm6xuGu0N4PvHxpkVf9ts7gT4Iv51nZbWbfNHSkL6HOpQODYJMQU
 18n3/1dsC2PGDjlP0BByq3XWZ5aiu7ShKvaRznkMOHRVOh/zCrWPgumQbX91OfdaR+Wyu6Wer
 y1CbsZ4T7yhaHrk7RywlDdCPMIZUpQUJmUgnkNQ3H/OCxpbyNJpqJGfWuXDGKtl2Ql+coVkvM
 9VkJqnfx0ZfN3Tcgn69GT1h11222KDtM9c3poXwfcUOJXqHiK02v3Ymecn0E=
X-Original-Sender: oliver.schwartz@gmx.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmx.net header.s=badeba3b8450 header.b=enUSoQON;       spf=pass
 (google.com: domain of oliver.schwartz@gmx.de designates 212.227.17.22 as
 permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
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

Check if the ID of the SiP call matches one of the configured allowed SiP
IDs. If so, forward the SiP call to ARM trusted firmware. Otherwise return
ARM_SMCCC_NOT_SUPPORTED.

Signed-off-by: Oliver Schwartz <Oliver.Schwartz@gmx.de>
=E2=80=94

Please note: I=E2=80=99ve only tested this patch on aarch64, not arm32.

 hypervisor/arch/arm-common/include/asm/smccc.h |  2 ++
 hypervisor/arch/arm-common/smccc.c             | 23 ++++++++++++++++++--
 hypervisor/arch/arm/include/asm/smc.h          | 30 ++++++++++++++++++++++=
++++
 hypervisor/arch/arm64/include/asm/smc.h        | 30 ++++++++++++++++++++++=
++++
 4 files changed, 83 insertions(+), 2 deletions(-)

diff --git a/hypervisor/arch/arm-common/include/asm/smccc.h b/hypervisor/ar=
ch/arm-common/include/asm/smccc.h
index 069beec..3549041 100644
--- a/hypervisor/arch/arm-common/include/asm/smccc.h
+++ b/hypervisor/arch/arm-common/include/asm/smccc.h
@@ -35,6 +35,8 @@
=20
 #define SMCCC_IS_CONV_64(function_id)	!!(function_id & (1 << 30))
=20
+#define ARM_SMCCC_CALLID_MASK		0x0000ffff
+
 #ifndef __ASSEMBLY__
=20
 struct trap_context;
diff --git a/hypervisor/arch/arm-common/smccc.c b/hypervisor/arch/arm-commo=
n/smccc.c
index 7734b99..6f401b4 100644
--- a/hypervisor/arch/arm-common/smccc.c
+++ b/hypervisor/arch/arm-common/smccc.c
@@ -90,6 +90,11 @@ enum trap_return handle_smc(struct trap_context *ctx)
 	unsigned long *regs =3D ctx->regs;
 	enum trap_return ret =3D TRAP_HANDLED;
 	u32 *stats =3D this_cpu_public()->stats;
+	u32 callid =3D regs[0] & ARM_SMCCC_CALLID_MASK;
+	struct jailhouse_cell_desc* config =3D this_cell()->config;
+	const u32* allowed_sip_ids =3D jailhouse_cell_allowed_sip_ids(config);
+	int i =3D 0;
+	bool sip_id_found =3D false;
=20
 	switch (SMCCC_GET_OWNER(regs[0])) {
 	case ARM_SMCCC_OWNER_ARCH:
@@ -98,8 +103,22 @@ enum trap_return handle_smc(struct trap_context *ctx)
 		break;
=20
 	case ARM_SMCCC_OWNER_SIP:
-		stats[JAILHOUSE_CPU_STAT_VMEXITS_SMCCC]++;
-		regs[0] =3D ARM_SMCCC_NOT_SUPPORTED;
+		sip_id_found =3D false;
+		for (i =3D 0; i < config->num_allowed_sip_ids; i++) {
+			if (callid =3D=3D allowed_sip_ids[i]) {
+				stats[JAILHOUSE_CPU_STAT_VMEXITS_SMCCC]++;
+				regs[0] =3D smc_arg7(regs[0], regs[1], regs[2],
+						   regs[3], regs[4], regs[5],
+						   regs[6], regs);
+				sip_id_found =3D true;
+				break;
+			}
+		}
+		if (!sip_id_found) {
+			printk("Unsupported SIP call 0x%x\n", callid);
+			stats[JAILHOUSE_CPU_STAT_VMEXITS_SMCCC]++;
+			regs[0] =3D ARM_SMCCC_NOT_SUPPORTED;
+		}
 		break;
=20
 	case ARM_SMCCC_OWNER_STANDARD:
diff --git a/hypervisor/arch/arm/include/asm/smc.h b/hypervisor/arch/arm/in=
clude/asm/smc.h
index 5cde3d8..6a3fd7e 100644
--- a/hypervisor/arch/arm/include/asm/smc.h
+++ b/hypervisor/arch/arm/include/asm/smc.h
@@ -37,3 +37,33 @@ static inline int smc_arg1(unsigned long id, unsigned lo=
ng par1)
=20
 	return __id;
 }
+
+static inline int smc_arg7(unsigned long id, unsigned long par1,
+			   unsigned long par2, unsigned long par3,=20
+			   unsigned long par4, unsigned long par5,=20
+			   unsigned long par6, unsigned long* ret)
+{
+	register unsigned long r0 asm("r0") =3D id;
+	register unsigned long r1 asm("r1") =3D par1;
+	register unsigned long r2 asm("r2") =3D par2;
+	register unsigned long r3 asm("r3") =3D par3;
+	register unsigned long r4 asm("r4") =3D par4;
+	register unsigned long r5 asm("r5") =3D par5;
+	register unsigned long r6 asm("r6") =3D par6;
+
+	asm volatile ("smc #0\n\t"
+		: "+r" (r0), "+r" (r1), "+r" (r2), "+r" (r3),
+		  "+r" (r4), "+r" (r5), "+r" (r6)
+		:=20
+		: "memory", "r7", "r8", "r9", "r10", "r11",
+		  "r12", "r13", "r14", "r15", "r16", "r17");
+
+	if (ret)=20
+	{
+		ret[0] =3D r0;
+		ret[1] =3D r1;
+		ret[2] =3D r2;
+		ret[3] =3D r3;
+	}
+	return r0;
+}
diff --git a/hypervisor/arch/arm64/include/asm/smc.h b/hypervisor/arch/arm6=
4/include/asm/smc.h
index 7cc9891..cadbcd5 100644
--- a/hypervisor/arch/arm64/include/asm/smc.h
+++ b/hypervisor/arch/arm64/include/asm/smc.h
@@ -34,3 +34,33 @@ static inline int smc_arg1(unsigned long id, unsigned lo=
ng par1)
=20
 	return __id;
 }
+
+static inline int smc_arg7(unsigned long id, unsigned long par1,
+			   unsigned long par2, unsigned long par3,=20
+			   unsigned long par4, unsigned long par5,=20
+			   unsigned long par6, unsigned long* ret)
+{
+	register unsigned long x0 asm("x0") =3D id;
+	register unsigned long x1 asm("x1") =3D par1;
+	register unsigned long x2 asm("x2") =3D par2;
+	register unsigned long x3 asm("x3") =3D par3;
+	register unsigned long x4 asm("x4") =3D par4;
+	register unsigned long x5 asm("x5") =3D par5;
+	register unsigned long x6 asm("x6") =3D par6;
+
+	asm volatile ("smc #0\n\t"
+		: "+r" (x0), "+r" (x1), "+r" (x2), "+r" (x3),
+		  "+r" (x4), "+r" (x5), "+r" (x6)
+		:=20
+		: "memory", "x7", "x8", "x9", "x10", "x11",
+		  "x12", "x13", "x14", "x15", "x16", "x17");
+
+	if (ret)=20
+	{
+		ret[0] =3D x0;
+		ret[1] =3D x1;
+		ret[2] =3D x2;
+		ret[3] =3D x3;
+	}
+	return x0;
+}
--=20
2.7.4

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CDEDE05F-D9F9-4CA1-A736-2A39CA63256F%40gmx.de.
