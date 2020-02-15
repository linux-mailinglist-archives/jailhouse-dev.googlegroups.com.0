Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBO6LT7ZAKGQELQHMCMY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA5215FE76
	for <lists+jailhouse-dev@lfdr.de>; Sat, 15 Feb 2020 13:36:12 +0100 (CET)
Received: by mail-lf1-x138.google.com with SMTP id k26sf1287489lfm.0
        for <lists+jailhouse-dev@lfdr.de>; Sat, 15 Feb 2020 04:36:12 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581770172; cv=pass;
        d=google.com; s=arc-20160816;
        b=02s2xIijsxnSxM0a/kBFsQVrqmqDdE2W9s5eHTuFNnlbRZf4/+NtHS2Zmfm3jksDmn
         UXKAtDIRwgQCe5u4I31T6V9GkPVJ2G13yVUcy/bc5/KLwtUzVhoK1oA/Zh0c5gQPRAaB
         DSMgcly8mgOIPzd6CIr890iYubyXgmDxvhkHubi0gLPPC+jRxqmT6pivAPO7nBPEtlr2
         R2o/Je+HZP/ScweBOQRGbY11RT3vd9MHbPsdXJVpnwISamGTgHbTtcEziqYc38R93TSP
         N+RAyMBnSuFmafzd7EhhNy2LkGR1l74wQOarJNeoH9Tcmf9WEFvsuA/5dyIEPm1RNUfw
         FxEA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=YgnI8nHcUTqbZ3dRYvK2dHUJrdzRx/JE8fv6eyRC9Mo=;
        b=yKraUh1uqjwbCaFlizpPawxtiB9W968RbmdWAFHnx+Ye2rjfqu45XUGjuw9PMbIl8d
         o3cfbgq4WJPtyxyvGuAPQ8QEB3teD/LR7N4t8466aHUzu2kO52iYTezLkJSxt/Go3XtC
         3ExZeajOLzh1OrSZceHjte06MIG4yOQkgrWcQIw6W87WW/fSA13jP0R3LOILGoKSLZht
         ck6btG5MuDcZjAvXBz6LAWqArD0323s6GI8HLpz403/XOYeIRXcr+D/9SNBYjpn2YWdS
         zHI/0d+Vd3itycQ6aNTandG32vZNRecevWG0lCKITi2ctrC1vOkLjZSPsegYBrT3ibXv
         hpmg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=RrcReg3z;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=YgnI8nHcUTqbZ3dRYvK2dHUJrdzRx/JE8fv6eyRC9Mo=;
        b=SHOAc33CBXoxjuksjmUNnV9MjhXjKZcZJlgmdOiHsvHpzPS0h9emGMmqdZqna8p4bQ
         P6jZSTimg44Dl3mNUQ0IETwBvUgWLAA8X+q/KAL0b37UlR95hDauU/AIV9PeH0HYTDXw
         4z653B99VRoFflWEO5ixKewnkdP0WdoNME3YFOp8/nmSaFxvj5dD7zcBA9Rjic/LPKHd
         IGe+adHGhEUJSDcKjJceES/9CxZ7p3q4mZg6skZxS8YAvLPGyz7pn5CBxbHr2NEpEGTr
         2lBxsA2qVVZD5FlNb2nu27+KnxXZhk77e4ZagW1/syln9B7sLgJBA0ovj1z7el/ZeSwn
         4YEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=YgnI8nHcUTqbZ3dRYvK2dHUJrdzRx/JE8fv6eyRC9Mo=;
        b=qUmIU2T64zGWlKq82U/cdIrgkDS/hn1lVhQSjeV8wDK3K3lrnr2b+hPDKclXdNWc0H
         oCyw+X1jJz5RxDsOvzca49bZrp5qjqcx8fv92Rw5CKNiMPTERvjT0CYlJxcx7+UKChRE
         YOLMA89Ze2OQB/VsrZVIEBSgBdGwu9Qx4Ev8z0XbnJCxZ0mjkKUQe8Gh83K24e7DbkXN
         KnF1avYR3Vxwvd+1qfMehET+p6wqItJt9kDyMNiZBkmYGvvllx6O+MLSR0RIVxcqxPZP
         fQlERcHlKb4RunyzOWKm25PYAsyFjd4OdHy0qkIIm9ajJS753aYJuVVAS/XSvU4VnNIs
         ihuw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWkClL75FU1ttIiI/j9puHbDIY02EmiBN9kKyTy8BcFDTLzfW3x
	cR8cNMN4pBv1LKzuJZE2WUM=
X-Google-Smtp-Source: APXvYqyASPTDN2pK3qeJHndkYzHI4LVLnE8Mw9qAYRoMnU2OY81zYUK/Mki3kGo94tXwJU04qyREVA==
X-Received: by 2002:a19:97:: with SMTP id 145mr3891290lfa.98.1581770172252;
        Sat, 15 Feb 2020 04:36:12 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:3a07:: with SMTP id h7ls958480lja.3.gmail; Sat, 15 Feb
 2020 04:36:11 -0800 (PST)
X-Received: by 2002:a05:651c:299:: with SMTP id b25mr5118055ljo.1.1581770171323;
        Sat, 15 Feb 2020 04:36:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581770171; cv=none;
        d=google.com; s=arc-20160816;
        b=lsoIKBW0ARbw58xOUpOmQbpO1NgUg+4rQh1BMzqnBhFYc6slVu6Mfoawln8Y+vliHJ
         CETj+hhPErXnjNc3Q52A+ifK8oP9XKCeXOdEN39zEDBIhnGfeZUErla4+D/At72PLCXG
         f3dfi3OeM2Na3cugErU/S6zm02VRU/awbehC6SIeuNwropLjt7Bxg83cZOrCQbETXRpU
         qCpPZw5rJLJ2Jj69XlKn956+slM51ONClLxL6agv0TzeUO+EKgYcDbdHnEyNE1pwRjZF
         xujMJV6Dj3Nk5njH24sFfL90hUlZiXBjXJ7rve0d8UH3sXJs9UvU2iGc80362bpysAhV
         8WAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=cBXYBgNZ4/l3ahafvoBsA/ZXM1XfEOd9JSUzn5/aNa4=;
        b=Iv2P0ybeyh9dw2xymi4LVlCEtsXshdVdMGMTIqG/T7Upnd9Ix4etAcBawmXbp5o8j/
         JYT6O5LIJ8009VBfiMA2afBMAKTHLhG/OpRco/qXgn/X3ouCawZMTpJqXCPKSCF2JKLx
         e4Ln5QeIXClxey/grK+cbhuf9NOWoa83Z86DX7ekmbtCKUHf8dIx3n7kgUV2wUxqIjmb
         7WIxhe2xxwH/qDCxrNTltBvHljtCPgjw8drM6M0eZmAyKc/qHmts5IsI2GejkvCwH7aR
         Ma6Y+2Vmt9+WFrpTF0aC9VuSmesXewoKiDGinA/lqsoxAVwikrjBnIV3/3HtZdbuj1Mn
         2cHA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=RrcReg3z;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.3])
        by gmr-mx.google.com with ESMTPS id j30si427776lfp.5.2020.02.15.04.36.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2020 04:36:11 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) client-ip=212.227.15.3;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([95.157.55.156]) by smtp.web.de
 (mrweb002 [213.165.67.108]) with ESMTPSA (Nemesis) id
 0MBCYn-1jAKWl2FSn-00AHrR for <jailhouse-dev@googlegroups.com>; Sat, 15 Feb
 2020 13:36:10 +0100
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 08/12] x86: Stop exporting apic_to_cpu_id array
Date: Sat, 15 Feb 2020 13:36:00 +0100
Message-Id: <4da2f64396ae900b1229acbf5fd82e7c0323a36a.1581770164.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1581770164.git.jan.kiszka@web.de>
References: <cover.1581770164.git.jan.kiszka@web.de>
In-Reply-To: <cover.1581770164.git.jan.kiszka@web.de>
References: <cover.1581770164.git.jan.kiszka@web.de>
X-Provags-ID: V03:K1:tlBkfu3MbEzGubohwiV5NQ3YUweX9hy1255BTmpnaidrQx9o8hd
 KWdfmK2PrN0Hng96p+Gx656LSnJCqu2GhRi7Gy9TCHFv0wad7ANx2nEsKk3O7z4Dn/qGvUG
 i7rcokXfWc5t+RSRyY9zFlV/hFy7qAzBKuzLTJHrT8HxuHbuqLUfR1UWT9VcxYpA2Gocv8E
 pM9PnUedys7fpJf7CFgrA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:OYXT+W2MIgQ=:pzBe6k3tNIhUnZ165wogYn
 6Hp3qtxDtj+4uDoKPlDeF5Xcs6/T1DFPNtmytEyyrS3fmiJSM35H5u7AC8UuMWy8ByWSkvxoI
 15ks73EqbjtAoT7Dpvq2fWucIhKPcwN2xN5aVzoW6QWUdH4Gaqf47GeKs30i9xXtE4gCefnrn
 HBayfm+5FkpUtH+0NKRdNLg4U71LZ/+Sf2R5kpzh6xEBEA7pLZ0F96c3zejfhmGap1u4rzwn8
 A9+eMmgn+uZWUKY7FSrZ4JHNw0N7CMNwOPHTxvASZmO698PDOfBtk/UgiQGq+KIRJbUIDpP48
 TLzr7dzvUSqpzVoAHm0IoLiLS7yqC90raMKRDbn8lIORZUCme8w0zX5c0Loir5RGdbpKIV9a8
 a4XoAGBw+EUob0fwsDn5WRGiLo6V94aFJiN3Smhl5Neqinn8VIP6B2GkCj5loMhz0jc/Q2vaC
 ZNcCxowoQ0tXBRrOlEAt8FG+LXA710uasdulvKpylZsoQN8bCc0gVkDnUNaD5o+AId5i9dqlj
 OcZy3UQ2XRExWmqXqa3dwgkHmZ1c+ix2DNg03cULhGmfDmMBlaRXkKQDsrwlzIr5CF7tyrKLb
 dy9ARpwQgSPdOaNR6f6TSMXRbdvqCzcfAraEHDJbgDnVhcu7szZixTeBcMqeONAxIOdgFWQFM
 aUuYIOsRGjeT4QV4P+fb9NzzDdUitC9pGWZ6Gb8jao9vXFnKHx/FefF38yVtbh+ZAx/b/Y9+J
 JwWJDLpcp/pZ9mlZPlx7QefDr9eiNN43FvXvmvx7jjntFJ30EdOhUUWd5hmUWX8xiGITcwGZ7
 niM1vcHtrL9mFjsEG+JOWRnpTmT99eWyEdu1EgfSZPmXrmuPC02g17A5Kxy0Hwt8rgqsAiiCp
 QQOK9bVVpFpzVKLTapCsk3+DX+0tesuFsz4LsXywnJMSAly/9z2RGoh/Aw2gkRfsVnk/B2FtV
 iOWdPdYnu/jM03rSQGakJIHh1yiMFH4RJfjUPEnWNudRM0lQSaVGd/8daVaPM+U5FhF5WjadA
 ynzQooCLgRRToYGbgAXlevWQegSa5WVr9wE8WQco3fG6nxnWzvW+uQVwmpB11oaA+SOSvvS2k
 KXyov5Fkqe+WTQFsSE88vA71rMrBb6gE3SoJEETv6OBs1vmFc4v/BkeuCzhpqOpMBf/Y5aGQL
 iGa5VQjU1196JSteCGeXocBmo4jud5bKNgFQVPW9932NWIJ7wzpE1w5pqrf/MttZ9eektXrB7
 Q+Kg08uf3szVBpq2F
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=RrcReg3z;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de
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

No longer needed since 1ff4937416fd, in fact.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/x86/apic.c             | 2 +-
 hypervisor/arch/x86/include/asm/apic.h | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/hypervisor/arch/x86/apic.c b/hypervisor/arch/x86/apic.c
index 40d6fce9..4f75bb12 100644
--- a/hypervisor/arch/x86/apic.c
+++ b/hypervisor/arch/x86/apic.c
@@ -34,7 +34,7 @@ bool using_x2apic;
 /**
  * Mapping from a physical APIC ID to the logical CPU ID as used by Jailhouse.
  */
-u8 apic_to_cpu_id[] = { [0 ... APIC_MAX_PHYS_ID] = CPU_ID_INVALID };
+static u8 apic_to_cpu_id[] = { [0 ... APIC_MAX_PHYS_ID] = CPU_ID_INVALID };

 /* Initialized for x2APIC, adjusted for xAPIC during init */
 static u32 apic_reserved_bits[] = {
diff --git a/hypervisor/arch/x86/include/asm/apic.h b/hypervisor/arch/x86/include/asm/apic.h
index 86cd0a9f..5bddf4da 100644
--- a/hypervisor/arch/x86/include/asm/apic.h
+++ b/hypervisor/arch/x86/include/asm/apic.h
@@ -150,7 +150,6 @@ struct apic_irq_message {
 };

 extern bool using_x2apic;
-extern u8 apic_to_cpu_id[];

 int apic_init(void);
 int apic_cpu_init(struct per_cpu *cpu_data);
--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/4da2f64396ae900b1229acbf5fd82e7c0323a36a.1581770164.git.jan.kiszka%40web.de.
