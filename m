Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBOWLT7ZAKGQETJ2ARAA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F54C15FE6F
	for <lists+jailhouse-dev@lfdr.de>; Sat, 15 Feb 2020 13:36:11 +0100 (CET)
Received: by mail-ed1-x53c.google.com with SMTP id m21sf9637350edp.14
        for <lists+jailhouse-dev@lfdr.de>; Sat, 15 Feb 2020 04:36:11 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581770171; cv=pass;
        d=google.com; s=arc-20160816;
        b=yHC0/YVOBJmjMjZasMzGxv2iS+p6FyzjOJeXNQNMdFaS7wLgAv077f+nwO8s7F5AKj
         Auvk9sDql5gqeGAC6lIT3Kw9UGCFY1Sp24UOpY60RPx9Zx/wIsq99PU4w6nVwyKqNiZy
         KDGndE7DFPp57ggUv+oWe4thEO4It6c+EGb0xhx/iXD/ZU/2c0e5nNvotF2hxzoohfjk
         IOv1yxX/JD2T6IbheDkyITpMyXpdY6gIMmVjunEPiNzhmpvaBwpscZquwyFmJbGZ9iQs
         Gp5Kwcf/C7QtTkV+AhKIIAzuolezlCrZm3Hihp71fUlQACpsIBSUrRXGI5eMPMX4C/YQ
         8WJQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=Nw0KQeVWvaoo6nSy+qCiPlmn4ghaeM55+G9bhsj6sEU=;
        b=J+a4pOYew7TN0hrjQ5AW4GGfF3uFZQZsbOmqCWNWb9LTXUCsNGMMbxBRdJmu4d2pJ9
         hkuAugGQ1Q0RaN4ekV4t5HkE3NY6c+NbwZ7zoHudRKbEhuF62pwrivs25T2DrN8V3XeA
         TrhJvjZMET/qk9+iacESw6HyllvWNlMwejAr6XWHujsVKpiY6AJdjdNj890ozqDEnRMD
         RhbkzAzOcnAzroaUcMVKZDXuP7gvWgBKLz29rGzNH3S7tdjb58hoOGy2MHFyS/fRDq+P
         KAZdh1tklGv3AjR+LSpFEPDkB8NlZcxAJ8nD9++qOU2kXoalfynWbiXQuQknrVbXaRPk
         jQnQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="m1fGh/8i";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Nw0KQeVWvaoo6nSy+qCiPlmn4ghaeM55+G9bhsj6sEU=;
        b=blH4O1e72WxwdTvM8wsAKRJyiw5B2cMnC4U6SVdgh6GyFBCicy1R+WNbh2Q8lLwhsg
         GSEAzUYGIcRYQI3EMFmGAF/jv3UVUr9VwoK6EEthPyJrAtEO8Ijqk1QsWJ7RtSboUHv2
         CMCr90mqeISevuLYe/+bP27IrrcFa7z7rhsAVkNc5BvKoHspm0TuYZnYc/FcXaNm3dQK
         PQtVwYa8/huwaY3Gpu7rjLVnBC3JtiSzbKis3o5nSrdWBlBNJuH/hnIacl6A2+MVVHnQ
         bBpjBu+iOSpfgE59IiJXkaKtYdRh69Hq66vHcWnhM84ZWbYzAkDkCDrDYEaKRmZz5U9d
         NtNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Nw0KQeVWvaoo6nSy+qCiPlmn4ghaeM55+G9bhsj6sEU=;
        b=uHx1HEwCTd8YbQHWicCJmjR/lR5ely4dYG7i3D91jlA4Hthyo00zo7C9nfTzv1bO1j
         hDv9qUrvzSRzyVOUj7ONmQeyYBr2zR6eDHFofnrZWSTs+LEIggvHSOZMHABh4L7AEhsv
         0uXGFmK2QFDGZyB6bU0C+B+BkVLsW6o+gUYxEhuH1pjuGlX8IPIL3CFVsZECqAECFShu
         R+Ynt8cOlSLexheoZwWQp0VIZYG071BrVkmqOWat+2pVZDiHxXWMcdxf705LuwF8PSRx
         AgXgFiWJiV5bMMnhf3cmBTBx1tPDiOgDb3fmPMDGStwJ/YXy27kVWgT46VcxWtOT7oH3
         wRmA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVFSl1qBF9UMQJvvPdzMKCNe0Ru/4A253cOhP/irh9yya7X0Jss
	AqslSeLX3tYzuG8QUbrXedk=
X-Google-Smtp-Source: APXvYqyRIHrF/W3s7jJBOwLDY6xBF/veanZNNaGRqeogZ8oEaGLNgCbB5fzNqEyN2XgyFhQd6W43zw==
X-Received: by 2002:a17:906:c444:: with SMTP id ck4mr7231411ejb.224.1581770170957;
        Sat, 15 Feb 2020 04:36:10 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:e20e:: with SMTP id gf14ls1786999ejb.10.gmail; Sat,
 15 Feb 2020 04:36:10 -0800 (PST)
X-Received: by 2002:a17:907:10d7:: with SMTP id rv23mr7405027ejb.38.1581770170371;
        Sat, 15 Feb 2020 04:36:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581770170; cv=none;
        d=google.com; s=arc-20160816;
        b=NCZl5tRMCHTG7LZQ7mrx55Waug9hknWWr9TYvKYWQ74P4FS9RG1Nbh+hKfHgphT83f
         AHwv47Q+2qy3PyDlVDGWcrTVks7BLV7zIYoWD19CaOJKuQHwoPL8RbUc0IhTDQKswm4q
         oxc09qWkRHK6Be/RvcaSTTW+33zR4cj08c9BuMhsFPKwDHIY0wfruTnbA8LC4fv+PqJO
         BMmo7mL178SSKewL20wtQeIRRccGCP2FV6pE9lVx78zSx3XlBGkUjGmDYniko01TP8sv
         KF0/RW9QxeAPPlEw73UGvNhKNvUxYLEoVZORQ+OPYs+SfxYYbT5AOpqKh1lNnfPShjuD
         9WLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=NnyPlxdFkHTVyYjwWtDhpoZYXdbEsACUeLxI5+ywZXQ=;
        b=wFmXB0PNG5IQKpgPC1jFFGiuTbBCHHhQAoWxMQNNtv9V+or9kAkwujjya5T3DZz6zy
         igAbRdOb21KctZbViUJoCpvO8UU9XsHfDISA8T2ImXvqOe9KrOeIrUZqe9eInsjeb6c6
         j6CLzBJe1ddGMR1AyZQqp4CxVUTRQsIp/6oWPqlDv+MiQa1sl8WaMXbv7Ik4x75qmYKH
         nh9U45zgxPLB2s+IPZP6BJmIDlzy1tRclrxxlMUIioWKdrTLK2ESEV7Lo3MXPeVYZk26
         7HHx2eOFESF1Ok9gJwQGQg9HSM67z10KbmDzw0sKIZUKF+OAZuPQRBbFU+mjU4C4epfO
         XHLw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="m1fGh/8i";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.3])
        by gmr-mx.google.com with ESMTPS id z20si409674ejx.1.2020.02.15.04.36.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2020 04:36:10 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) client-ip=212.227.15.3;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([95.157.55.156]) by smtp.web.de
 (mrweb002 [213.165.67.108]) with ESMTPSA (Nemesis) id
 0LfAfQ-1jrOZV3VUG-00orHM for <jailhouse-dev@googlegroups.com>; Sat, 15 Feb
 2020 13:36:09 +0100
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 04/12] core: Remove DEFINE_SPINLOCK abstraction
Date: Sat, 15 Feb 2020 13:35:56 +0100
Message-Id: <fb099cc16bdc03fc20a0b7f41bb88d998f63745b.1581770164.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1581770164.git.jan.kiszka@web.de>
References: <cover.1581770164.git.jan.kiszka@web.de>
In-Reply-To: <cover.1581770164.git.jan.kiszka@web.de>
References: <cover.1581770164.git.jan.kiszka@web.de>
X-Provags-ID: V03:K1:lrFkl6lIqfMJ/4zjJ9Af+LBDUM0+N8blqkOXTzoOv5De4675BYN
 gYzFm8AffgoPIqb41t6K3gnCxS2ZKbUV8yaA7FA6HQPfER05XsSTXhL/br0avTjC+ON2X/Q
 p3yhLVoUP8bWsV9oIlVUeGqHZvLccHR29p1BM6gm44Xq0oyeWRh141ECdUXoi1tRQ1lPnE0
 qLQHhudKaVbOyVvk961VA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:uqvcse11zVg=:8HSvGHBY+or3R2iY/C6RGD
 oihKwLC7wwVBVLAzDqxU1q0gteNQApoJyt7PRtB0h7XsUnDqmA15DT02TE+seu6Ky7Gcl6OJ7
 V4pZzGvJnKUoLCuScs3L7cD51Nq8tPTz4RjoArJbhANQOOErVMKon4pl7x9sh2MFgedg0oiJ4
 8/UUU8smtHkicWaE5+b3B2WHDc9PTt+ZogEMJh9RsKwxenMo+HHrh3gbVoFGg3LCTlClZYnlP
 EfXaMwA23/sR348k+e8D3P9+mXdr1hreEYbcNlbYogwnUJZclmIHwCil9RnqCk1kBYbQlTGx7
 Ejrz5dv3PyvM3frYa7KC+FOAWxZ2bmBgYUVIsbtUEmH3nyM+GsTtzwYxDc4PNvXYXHpVi5dQE
 P9/xy9Ho8oBJ7z9MeE+TLQAAIIKIbzpJMTk0hx9WuOlq7S5JO5tpFonvBeXDrLS2fecg8ATHK
 bOlmg+0Lfc0XWNHbyK73Zuq1d8iCmPHjO3hj/oi2cNKd1DOCM4rnsqddS7jXnKTOwl34YAQje
 s0XUNSEYlbcIFOAFPPCS8E/M4Doi4YykR1tidyVapeG0WL9J4Sb8ms9aAdkq3Ek4mdZucmycr
 L/CLbXotXu4rYUEFVklGW7/Ag+d99M0d8oLiHpCekjRuyW2iiCu5/WB8gTT6fSkptir9isfU8
 vdFLfclKLSXQa1BJHjzGWxeA5RoDi4ZfljmkfUDZOKx5BMoGdIdfUc3MJHYa57QQiFT/Mf0fw
 O6/8Te2sqFxAOTP4vxXL1tTwh2qitm5KfP/xmYWorE82CLky8nYKZfPzMuvkvvBgftsiOvInT
 fIJlha5+zf3dnuEEZWozDQGKUyfhajr9bmTKnFz9jYz2uREwT2GYwVExm1jjpqNDLzAm7cMzt
 97AsYdzFkfR2iGHsqh5q81EAAWHHXksH3lq+O7GQ7p4X9znc/MnNbdNMyL/VLhy4nj2Dtp2ml
 FPvgr4W5D5hsAfHi5OXd/wNafthRKqQGBsw71p4B7bvjfvHA6mvZ/IAqBvIy94fI5T7tmNS75
 pLfpRXTLu4JIeXLELx1CZ/K+YMEdpawQutX3EakPtA9DI6Qo+XnPwBGCXczC5sD6fyVOsAhvv
 SnWp60Q3KT/5ZL8LD08ffAVNttykbb8IMn/bmaypUPVwPoc9TekPQ6kNxMftsdQ//Elzfyb99
 jsaz5wMc0e6/KsH2UaD5ZndeYKCtx6xxkNtVCnQje5dPvnX05bfqLkFeoTx44tYf/iJiTywxZ
 GLYGsPQbaaIirkyYU
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b="m1fGh/8i";       spf=pass
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

It's highly unlikely that we will meet an arch that needs a non-zero
init value for its spinlocks or has any other use case for this
abstraction. So remove it.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 Documentation/Doxyfile                       | 1 -
 hypervisor/arch/arm-common/irqchip.c         | 2 +-
 hypervisor/arch/arm/include/asm/spinlock.h   | 1 -
 hypervisor/arch/arm/mmu_hyp.c                | 2 +-
 hypervisor/arch/arm64/include/asm/spinlock.h | 1 -
 hypervisor/arch/x86/include/asm/spinlock.h   | 2 --
 hypervisor/arch/x86/pci.c                    | 2 +-
 hypervisor/arch/x86/vtd.c                    | 2 +-
 hypervisor/control.c                         | 2 +-
 hypervisor/printk.c                          | 2 +-
 hypervisor/setup.c                           | 2 +-
 11 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/Documentation/Doxyfile b/Documentation/Doxyfile
index 7398fb9f..d7e76859 100644
--- a/Documentation/Doxyfile
+++ b/Documentation/Doxyfile
@@ -264,7 +264,6 @@ INCLUDE_FILE_PATTERNS  =
 PREDEFINED             = \
 	DOXYGEN_CPP \
 	__attribute__(x)= \
-	DEFINE_SPINLOCK(s)="spinlock_t s" \
 	DEFINE_MMIO_READ(s)="static inline u##s mmio_read##s(void *address);" \
 	DEFINE_MMIO_WRITE(s)="static inline void mmio_write##s(void *address, u##s value);"
 EXPAND_AS_DEFINED      = COMM_REGION_GENERIC_HEADER
diff --git a/hypervisor/arch/arm-common/irqchip.c b/hypervisor/arch/arm-common/irqchip.c
index d0bd50c6..6b6f7332 100644
--- a/hypervisor/arch/arm-common/irqchip.c
+++ b/hypervisor/arch/arm-common/irqchip.c
@@ -29,7 +29,7 @@
 	     (counter) < (config)->num_irqchips;			\
 	     (chip)++, (counter)++)

-DEFINE_SPINLOCK(dist_lock);
+spinlock_t dist_lock;

 void *gicd_base;

diff --git a/hypervisor/arch/arm/include/asm/spinlock.h b/hypervisor/arch/arm/include/asm/spinlock.h
index a1e9a271..7fe841d0 100644
--- a/hypervisor/arch/arm/include/asm/spinlock.h
+++ b/hypervisor/arch/arm/include/asm/spinlock.h
@@ -18,7 +18,6 @@

 #ifndef __ASSEMBLY__

-#define DEFINE_SPINLOCK(name)	spinlock_t (name)
 #define TICKET_SHIFT		16

 typedef struct {
diff --git a/hypervisor/arch/arm/mmu_hyp.c b/hypervisor/arch/arm/mmu_hyp.c
index 16f9b5ae..1fcebef5 100644
--- a/hypervisor/arch/arm/mmu_hyp.c
+++ b/hypervisor/arch/arm/mmu_hyp.c
@@ -330,7 +330,7 @@ int switch_exception_level(struct per_cpu *cpu_data)

 void __attribute__((noreturn)) arch_shutdown_mmu(struct per_cpu *cpu_data)
 {
-	static DEFINE_SPINLOCK(map_lock);
+	static spinlock_t map_lock;

 	virt2phys_t virt2phys = paging_hvirt2phys;
 	unsigned long stack_phys = virt2phys(cpu_data->stack);
diff --git a/hypervisor/arch/arm64/include/asm/spinlock.h b/hypervisor/arch/arm64/include/asm/spinlock.h
index ac7063b7..1d05174b 100644
--- a/hypervisor/arch/arm64/include/asm/spinlock.h
+++ b/hypervisor/arch/arm64/include/asm/spinlock.h
@@ -21,7 +21,6 @@

 #include <jailhouse/types.h>

-#define DEFINE_SPINLOCK(name)	spinlock_t (name)
 #define TICKET_SHIFT	16

 /* TODO: fix this if we add support for BE */
diff --git a/hypervisor/arch/x86/include/asm/spinlock.h b/hypervisor/arch/x86/include/asm/spinlock.h
index 8ca5638f..ef884246 100644
--- a/hypervisor/arch/x86/include/asm/spinlock.h
+++ b/hypervisor/arch/x86/include/asm/spinlock.h
@@ -23,8 +23,6 @@ typedef struct {
 	u16 owner, next;
 } spinlock_t;

-#define DEFINE_SPINLOCK(name)	spinlock_t (name)
-
 static inline void spin_lock(spinlock_t *lock)
 {
 	register spinlock_t inc = { .next = 1 };
diff --git a/hypervisor/arch/x86/pci.c b/hypervisor/arch/x86/pci.c
index fdd27d19..f03e6a1b 100644
--- a/hypervisor/arch/x86/pci.c
+++ b/hypervisor/arch/x86/pci.c
@@ -23,7 +23,7 @@
 #include <asm/processor.h>

 /** Protects the root bridge's PIO interface to the PCI config space. */
-static DEFINE_SPINLOCK(pci_lock);
+static spinlock_t pci_lock;

 u32 arch_pci_read_config(u16 bdf, u16 address, unsigned int size)
 {
diff --git a/hypervisor/arch/x86/vtd.c b/hypervisor/arch/x86/vtd.c
index c845fa94..d33d429e 100644
--- a/hypervisor/arch/x86/vtd.c
+++ b/hypervisor/arch/x86/vtd.c
@@ -201,7 +201,7 @@ static void *unit_inv_queue;
 static unsigned int dmar_units;
 static unsigned int dmar_pt_levels;
 static unsigned int dmar_num_did = ~0U;
-static DEFINE_SPINLOCK(inv_queue_lock);
+static spinlock_t inv_queue_lock;
 static struct vtd_emulation root_cell_units[JAILHOUSE_MAX_IOMMU_UNITS];
 static bool dmar_units_initialized;

diff --git a/hypervisor/control.c b/hypervisor/control.c
index 2ab6beac..c1a4edff 100644
--- a/hypervisor/control.c
+++ b/hypervisor/control.c
@@ -32,7 +32,7 @@ struct jailhouse_system *system_config;
 /** State structure of the root cell. @ingroup Control */
 struct cell root_cell;

-static DEFINE_SPINLOCK(shutdown_lock);
+static spinlock_t shutdown_lock;
 static unsigned int num_cells = 1;

 volatile unsigned long panic_in_progress;
diff --git a/hypervisor/printk.c b/hypervisor/printk.c
index c3241777..4b001970 100644
--- a/hypervisor/printk.c
+++ b/hypervisor/printk.c
@@ -22,7 +22,7 @@ bool virtual_console = false;
 volatile struct jailhouse_virt_console console
 	__attribute__((section(".console")));

-static DEFINE_SPINLOCK(printk_lock);
+static spinlock_t printk_lock;

 static void console_write(const char *msg)
 {
diff --git a/hypervisor/setup.c b/hypervisor/setup.c
index e761415a..9f651aec 100644
--- a/hypervisor/setup.c
+++ b/hypervisor/setup.c
@@ -26,7 +26,7 @@ extern u8 __text_start[], __page_pool[];

 static const __attribute__((aligned(PAGE_SIZE))) u8 empty_page[PAGE_SIZE];

-static DEFINE_SPINLOCK(init_lock);
+static spinlock_t init_lock;
 static unsigned int master_cpu_id = -1;
 static volatile unsigned int entered_cpus, initialized_cpus;
 static volatile int error;
--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/fb099cc16bdc03fc20a0b7f41bb88d998f63745b.1581770164.git.jan.kiszka%40web.de.
