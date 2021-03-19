Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBANL2GBAMGQEA5KMT4Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAC63416CE
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 Mar 2021 08:40:50 +0100 (CET)
Received: by mail-lj1-x23b.google.com with SMTP id l8sf17704982ljc.14
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 Mar 2021 00:40:50 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616139649; cv=pass;
        d=google.com; s=arc-20160816;
        b=FydKVfgH/A03e1ydIrrJNvxh5llAGIPphAR9JTdgVP9sE/zxZGNMpd4udd43ZMmPtH
         umdd61H/qeXSaYckoOMoqvNC8/JRBn++t1krqNcV8tXT+DgtXBO4M613zYRovsKh80M7
         jbaRPAr29RSFQsjo2glcuaf44dw6XmKIAZqX7i6aeQQ39R2Jwf3BtjX+pRo/p8OmMQyN
         cCaRA2UwliO6Q9ciVX2Z1kKG8eN6XXCRThg2zz1Wty4TwW0GCZ809SOzqm+KGL1ZRuw4
         XhImnvXeTRaBHGeplwV/xZc8hS50HA/ZhpYJ9ScMTn1n7brYJhTO0RCdFbgvZk0UCouX
         easQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=/UwAETLYReG78g5g7oCOymJIXLlPB0PuB269Ax3KCKw=;
        b=LPrX8gJq//218MDpt5HQcDueknbstjzm1/SNU1m1WwHvkLfEv+x6XJ5YpE0cktvhEO
         9Vey6mZhQ6aJUuO6Auz0JvMIo4QRDLNWNMHCeU2xPzxqPAV4Ndz0ttAGzjP2Cb1M77KD
         zhbcnpxWunCuHgyASutdy2knhbphVZP58rWNteIqNqN/eR6EDnDES8JNQqyyqf+m9sPE
         J4l+We7dLcP6PQlOMgEOUhCwlSYAKAkaYCphQaO1etU1humjThap0RI7MsZk3wIOYC8n
         8w8+M+QHXCfXUKiWk7vy/PS7uRUXNO34jrHawNxF1gVCn4HtxOtJlnYDwC8J6Qr2x1sq
         eNYw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/UwAETLYReG78g5g7oCOymJIXLlPB0PuB269Ax3KCKw=;
        b=b9AroPqWEi/7j8dZma3uGzdIpDIpzNNpEHfN5M0jWR6tUWtykh29IsYkvsqNVRDRX0
         h1Qe+aIVEPza9ytgJyMjRVelOFeT8F3Rhf7zO+NdZgq9NhSdbMHglty9P46t0omb/Y38
         78y0Pz6odHEXLm5cV8FiXMy1yySy8qa9DrzEF+pqSBV3NucHLYTSpcA/T9TWYb12Rlyq
         FGa0YpOjcSWZkULlc2J6XglZrOpMtmTn/4NfRfGXFvbcfN8LFarqSBnkVW0XpvW52P5z
         5NflBioX7JoMVfJI83QlVBY5TGpwGO4J9WnBiJ7/ZWo+3rcnv98dJEdPfGfiFtOAkjXp
         76Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/UwAETLYReG78g5g7oCOymJIXLlPB0PuB269Ax3KCKw=;
        b=ONbN5HuHG/VM9wyCSAhUy4kVTBWJx5pyRwZ1Qfw5nl7yF11HMOgl3pSJwOUItptrBg
         QyOABX+IauH5E4cJnkRvrSuh1CNnL4p01IL2FfEDfzXU2oIX5FOD5+nu0DAKErm+59/n
         AoWuuPVALwOHPuL7LSQrX7bVpqJViODKQYb7+oJ0Ope86kAvIRQAUWsJzj7NpNskJ6yY
         /Sa/KorE5gajfMf6qcMsnhGepOXX2aiC5kyMFks3TSnFvjLcUR4/JpX8ewHLl3o32yZ0
         D2abEKLl8M7src/obieVzCbTRxOa0KSmUsno7XbJMus0KbVIXG5wMRL/0reA8qpuBfp/
         prmw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532YgSkEjvyh/kHdNxT4z7YCXQiUQTjDpn4PD5rPvd3AhbflEra7
	pG3zo0qSvO5y/vF2kdbSsk4=
X-Google-Smtp-Source: ABdhPJw6OvtPv9qmRA7+4CI8KLVwq0HU2EncHgI+p6FB65ItaBSOIuJB6pnb3FgEK5FLa4/k5ZQmNA==
X-Received: by 2002:a2e:9a0a:: with SMTP id o10mr75387lji.432.1616139649702;
        Fri, 19 Mar 2021 00:40:49 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:589:: with SMTP id 131ls1015181ljf.9.gmail; Fri, 19 Mar
 2021 00:40:48 -0700 (PDT)
X-Received: by 2002:a2e:96c3:: with SMTP id d3mr87735ljj.284.1616139648552;
        Fri, 19 Mar 2021 00:40:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616139648; cv=none;
        d=google.com; s=arc-20160816;
        b=g5i3A2kjqe7mrRI8MTcGsfc0HsCspxAQMf6T8e+HD79odtTEYaJvyiK5t+4hWPh1FK
         dJ3Be+moToz4lMfxsmp/Vu7nDpnJlLdXkyeGfCptW8fsypezZa3EFIv6sfxMT3GHq6ds
         N7xWAS3LKIl1qEK9Io4tcHMUDb7S1hMpavcr5CgEQvkAViNF7mUWyR847v0wlrQFwGDH
         kctBuDyZmjSIyLt987azmrS56DqI/p84qQUZ6RZ5oCaMCC8JqKQVHCqTxgiX6gTZ/JCf
         onhNCfe8JfPLbFQp+y3tM5avHEMwihu77FNOI6l08NTnJBbUrZNpcmgI6OONgJprOeMZ
         hNJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=k5rTpj7IOg1RDiwWXeb/cJB6TbRNKKhXZSSJwqbPvPg=;
        b=yRiZ9uu6huboI4CbhnOz9xR1nqmMLAwMVDslP5/ZZAE+hEnhFEqcCpKZM15INidT45
         kDpI+V/0oSMtGADp3S4MUxeH9BTvkAn5oB6PPPZq3vyWXdEBd2qqqolZeL9smda1Lwnj
         egYUpX85k5z/I0Fc8p02wK9Mexd/QNsl3D6GvEFDWH8XukDj5eZVT6t32KWfOwC5G5aa
         gQSAQILgD+4PqkeRAkwxehY7EQX0qnq6pOp8qpllrHy7zMgP4GdKLj3/00w/yzJVUpZB
         4wRhsX95v7Tve1mEBLHeENBzewbQjJxvmNsO5UsPWAMJbHZ1ZcnRBmWwRRoe9Ir34sFD
         nauA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id 63si154317lfg.9.2021.03.19.00.40.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Mar 2021 00:40:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 12J7elOC025507
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 19 Mar 2021 08:40:47 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.41.130])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 12J7UjC6004384;
	Fri, 19 Mar 2021 08:30:47 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Cc: Alice Guo <alice.guo@nxp.com>
Subject: [PATCH 08/11] arm64: Do not trap interrupts when using SDEI
Date: Fri, 19 Mar 2021 08:30:42 +0100
Message-Id: <31b3017324624b02a6731d9a5c6194208e7b3e3e.1616139045.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1616139045.git.jan.kiszka@siemens.com>
References: <cover.1616139045.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

They can (and must) be delivered directly to the cell in that mode. GIC
CPU interfaces are already passed through.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/setup.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hypervisor/arch/arm64/setup.c b/hypervisor/arch/arm64/setup.c
index d8c58504..376648e3 100644
--- a/hypervisor/arch/arm64/setup.c
+++ b/hypervisor/arch/arm64/setup.c
@@ -74,6 +74,8 @@ int arch_cpu_init(struct per_cpu *cpu_data)
 
 		if (smc(SDEI_PE_UNMASK) != ARM_SMCCC_SUCCESS)
 			return trace_error(-EIO);
+
+		hcr &= ~(HCR_IMO_BIT | HCR_FMO_BIT);
 	}
 
 	/* Setup guest traps */
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/31b3017324624b02a6731d9a5c6194208e7b3e3e.1616139045.git.jan.kiszka%40siemens.com.
