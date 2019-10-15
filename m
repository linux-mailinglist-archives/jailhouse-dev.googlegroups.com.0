Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBVHES7WQKGQEICVFMDI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA46D7B1B
	for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Oct 2019 18:22:44 +0200 (CEST)
Received: by mail-wr1-x43e.google.com with SMTP id l12sf10370414wrm.6
        for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Oct 2019 09:22:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1571156564; cv=pass;
        d=google.com; s=arc-20160816;
        b=rn9ul5MY3XMIPUNK+caJMNZmDnagJbUPMLn2kF/TVp2ppc3k2ASgvZgm9Z6kuGLk6E
         YUY5AioeFJNhwMGXdb/kyL98SgyWt0IltO6/Tr+oqJ8o50/yvixjytVkLrcUWs1RLh8L
         m1qf467kr2wWAkbkLmf/EcJRtO9SpKOxyHPk2GhT2Oq+Vl9Ghd86Zs9YIWt50u7ty/KN
         91vEPVeX849aHpn1EANUgF4yjGcACP4IQhE1c7CwszZYS8pJuxbQmQPYU9d8sedTYXlM
         zzNLLLu51ao4ypxWxNjxsw/VPicpPPsyCURgpyEl6mZlb2ANAZr1BeIcy9BCF4xE2ftE
         YYtw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=dpoabGWfbsEwwwdmVB+IGXrOb9Eq3jHF7ZA8C0UY18c=;
        b=hUf5/7R8/HLSoa/lcWcfiySIFC9E0EGVMnHPmYteV0NeQhCIiWXkJBXDe+gitOe2fv
         6eP9Olk7Ng7KABE004GLYadTKOC9VNIJ49yzPYkaoIGI8Ypt+CIev6rjU/iWdQzgZ8GG
         0XBU4Xpek5YsjxrOLZVlCArZ5sXlYV9BxktXV/1uM2QpyBUgMpoUWxfdF8xpqoEretaB
         9vVIJBa7TVC+uzA9vd5aiRF1yx0KUSa12AlHZwSvNTOWZPzUbPRcS7Bqs3delCzCjngw
         ci59OVZbVC/+PS09at2ohBLz4QhebIkYVTXD05SYdO/SwvccMY6EZK8GscU189wMbCdN
         dTdg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=dpoabGWfbsEwwwdmVB+IGXrOb9Eq3jHF7ZA8C0UY18c=;
        b=dm9xTcZ0Q420XKR9iNi8fjPCy8M4JtwohY6/mqcuJP93vBRk3hLvkKcv9wJcRqdRgD
         dE128b/BMCzlxwLh3mQZli4VVkvy+lBpzofqh51P4S88eIfRCj3x2c/xpggB32MXQDpU
         OjOasJWfkn9MMWW1vFh86uzZpT+nAQ6Z06dAHkXosiYfcwQKaa7EuZ0jjtqkqxzzFuUf
         2NJCIGDuGG6grHeerHpIDuRjrcbemBBrjeYarfV3gPpLxWljYF01+r1r2q9mq1uS70xo
         VYD38fR7qcZRUMdHTi/IRYENvAWHUuw4qNcKEQN7IyjYN+7+sRGDHvYJ1wS+mw6YoyL3
         HXhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=dpoabGWfbsEwwwdmVB+IGXrOb9Eq3jHF7ZA8C0UY18c=;
        b=GG6N/OekzPuFsNUSvNXQEwYzTIM2w6viL7HWjsvOOuEDHq/f+1I/3D1FkQDbbVqcqn
         HnUlpbX+/7/z6RvHoSLOpD7eP7Rd00wUdqO0ZqvqSyHRQ2Pa5k//Jj3s30YsOy8EHi2v
         w5MtfMFai9wyQFjkW8eLWhCwlTR3pkdDxQTvIOq6QSvA4ITAfGPXZpnVaTYFautExmpy
         3ld2hvZ0ZZ36JOpcDyuvm0Taxs2Eu0Gnbxd7gt0x5zGWpPDar7mi02MTPFXlGygKcxug
         saothSKQFvoGeXLQEnaVl1rPlV/nvGN36p1wUtomO0rtDnQfIKxmBawP8FvEuVnRZ7d6
         qURg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXOK7zcqb7HUxD4zDFu6joyd83TCBsQhXqhP1kv7ifbYxlzU3N/
	juyWn8F++utlbDRPG60Aglo=
X-Google-Smtp-Source: APXvYqwVX17K2oCtwRPUnpq+ZWFLHpbDyjDU/2aJ5v7tjNUlpOH7YR/Q3crfCbu0KlcVS/iSVKz0AQ==
X-Received: by 2002:adf:f4c2:: with SMTP id h2mr32260903wrp.69.1571156564322;
        Tue, 15 Oct 2019 09:22:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:b7cd:: with SMTP id t13ls7141656wre.5.gmail; Tue, 15 Oct
 2019 09:22:43 -0700 (PDT)
X-Received: by 2002:adf:d848:: with SMTP id k8mr34278155wrl.189.1571156563580;
        Tue, 15 Oct 2019 09:22:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571156563; cv=none;
        d=google.com; s=arc-20160816;
        b=T67yZS43053swqTy6dYoBGJccA6OUigAFqIovemXzMuMpGkxR9ZVz/Hj9YEW6F8IgN
         zrazUOB5WiFH2IB4m3kHg/JtPT+uXZk5Bjpa/P6H313b6nAZfeYcBLr5uDV1g8QxiV4H
         E20EQR294IR5ANawibZqdS8QTq+7QabZRcgAAb9ZWDwHIosqNcMtrbNA4gU9iYwK5BQJ
         L4HOHAJKJE9iBE7PF8v9dYimpQROPnvVzQWVHubX/guaN1MTAxG6Om8t5flZrB4Y07bh
         6Nk++QtY0QyYEWukGFsil0yEdoZzkcstHVxlHlMl3WC1EJPOFK9Bq6Q7k098RpjypTM1
         KvjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=WUgNJdPJfQ6Nvyiw3vSvYs4FKgkQnoEkdemnlNjeRaw=;
        b=YOKXHeNbH1wyEQ/9supFKAaCKRIGxd9DN+PZnV3D4vh4ATjks/tk7WDHNu5enxd32t
         DPKXLOj2z143b3v8A47aADSgqXYyNFtn0CJ777f8qtMqE5gv5dTiPdJs1KUmqk+pHc7h
         exvNedgsLK/AftJoF2OqW3ACNQznFwvRrhzKuJXlQf9Jf1lK31Xor8S7JFNpAgUi2hYc
         aHT9oUt7NbXMFwrzlf3NMpOKNjcByQS4OA5SjsfS6c6HzeB1JEdkAAhahshDwgqoX3FL
         cwnVo/7B1Em6NGX0A1s4DYAGSAVW0D3SIZ7hUfbrzCGQTLQAqn1H3EBOBc4AFamOeuUi
         ZdVQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id p12si653193wmg.0.2019.10.15.09.22.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2019 09:22:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 46t11H1K3Tzy51;
	Tue, 15 Oct 2019 18:22:43 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>,
	Andrej Utz <andrej.utz@st.oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v4 01/13] tools: jailhouse-config-create: Rename regions to mem_regions in preparation for port_regions
Date: Tue, 15 Oct 2019 18:22:30 +0200
Message-Id: <20191015162242.1238940-2-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191015162242.1238940-1-ralf.ramsauer@oth-regensburg.de>
References: <20191015162242.1238940-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.10.15.161817, AntiVirus-Engine: 5.65.0, AntiVirus-Data: 2019.10.15.5650002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_2000_2999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FRAUD_MONEY_CURRENCY 0, __FRAUD_MONEY_CURRENCY_DOLLAR 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of ralf.ramsauer@oth-regensburg.de designates
 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

From: Andrej Utz <andrej.utz@st.oth-regensburg.de>

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
[ralf: leave brackets]
---
 tools/jailhouse-config-create | 10 +++++-----
 tools/root-cell-config.c.tmpl |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/tools/jailhouse-config-create b/tools/jailhouse-config-create
index 55601a6d..c3226dde 100755
--- a/tools/jailhouse-config-create
+++ b/tools/jailhouse-config-create
@@ -269,7 +269,7 @@ product = [input_readline('/sys/class/dmi/id/sys_vendor',
 inmatemem = kmg_multiply_str(options.mem_inmates)
 hvmem = [0, kmg_multiply_str(options.mem_hv)]
 
-(regions, dmar_regions) = sysfs_parser.parse_iomem(pcidevices)
+(mem_regions, dmar_regions) = sysfs_parser.parse_iomem(pcidevices)
 ourmem = parse_kernel_cmdline()
 total = hvmem[1] + inmatemem
 
@@ -283,11 +283,11 @@ if vendor == 'GenuineIntel':
                                                            dmar_regions)
 else:
     (iommu_units, extra_memregs) = sysfs_parser.parse_ivrs(pcidevices, ioapics)
-regions += extra_memregs
+mem_regions += extra_memregs
 
 # kernel does not have memmap region, pick one
 if ourmem is None:
-    ourmem = alloc_mem(regions, total)
+    ourmem = alloc_mem(mem_regions, total)
 elif (total > ourmem[1]):
     raise RuntimeError('Your memmap reservation is too small you need >="' +
                        hex(total) + '". Hint: your kernel cmd line needs '
@@ -298,7 +298,7 @@ hvmem[0] = ourmem[0]
 inmatereg = sysfs_parser.MemRegion(ourmem[0] + hvmem[1],
                                    ourmem[0] + hvmem[1] + inmatemem - 1,
                                    'JAILHOUSE Inmate Memory')
-regions.append(inmatereg)
+mem_regions.append(inmatereg)
 
 cpucount = count_cpus()
 
@@ -311,7 +311,7 @@ f = open(options.file, 'w')
 tmpl = Template(filename=os.path.join(options.template_dir,
                                       'root-cell-config.c.tmpl'))
 kwargs = {
-    'regions': regions,
+    'mem_regions': mem_regions,
     'ourmem': ourmem,
     'argstr': ' '.join(sys.argv),
     'hvmem': hvmem,
diff --git a/tools/root-cell-config.c.tmpl b/tools/root-cell-config.c.tmpl
index f9805dcd..b6522ce1 100644
--- a/tools/root-cell-config.c.tmpl
+++ b/tools/root-cell-config.c.tmpl
@@ -45,7 +45,7 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[${int((cpucount + 63) / 64)}];
-	struct jailhouse_memory mem_regions[${len(regions)}];
+	struct jailhouse_memory mem_regions[${len(mem_regions)}];
 	struct jailhouse_irqchip irqchips[${len(irqchips)}];
 	struct jailhouse_pio pio_regions[6];
 	struct jailhouse_pci_device pci_devices[${len(pcidevices)}];
@@ -126,7 +126,7 @@ struct {
 	},
 
 	.mem_regions = {
-		% for r in regions:
+		% for r in mem_regions:
 		/* ${str(r)} */
 		% for c in r.comments:
 		/* ${c} */
-- 
2.23.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20191015162242.1238940-2-ralf.ramsauer%40oth-regensburg.de.
