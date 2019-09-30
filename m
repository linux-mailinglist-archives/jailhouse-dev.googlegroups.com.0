Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBB4VHZHWAKGQEE5RGR6Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCA9C2629
	for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Sep 2019 21:13:55 +0200 (CEST)
Received: by mail-ed1-x53c.google.com with SMTP id s29sf6946285eds.21
        for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Sep 2019 12:13:55 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1569870835; cv=pass;
        d=google.com; s=arc-20160816;
        b=mdmb5cRuafujDqAAT/v0/JUsnUDKhXX7Xr/58zEd/fVot6V797ELflqp8V8oDIGMfQ
         UbACxKcvqMVOTzKcMcyeurDumwJcDzRKDfZy8VDscqlAk8tlXwD2+TfTk+SwPSysE3Y3
         llHN80QPkxA9y60PxAJAGWbe0FWhcbuvdWoiSyj01xMCsEIlROdAaECuI3Rh1ZMvJ0bu
         b5yZAjHqqqYw0PsLbR0g10BB/ET13L3736xe7sV8QxbgZp3gTjUrEO3MH9Nm6vY9X9/2
         GZq2wFPxmZF1f6niT1KacHrUQuqIUXlwxFBroFnouyNB4h8gpMPggHS7f7PkRuEFWwA2
         JvYQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=I1x7m8rYIM/AR+sH/8mnYsBeo4bHGG7wy82zGbxNP80=;
        b=0vyBIrbYWyfxhKN8P/vNbCb9xWFVR3HVBmtRnfmjWYgqKMpbi2wHqgoEhHE7G+OKKA
         1YgWMWIILBTlDMrR5cf6k1QzPXAhzE2Paxg9zjnCzMgDawkDYCBk3Ahc2HVOvlITWlqx
         imZmbX3ETWJ2ikMBA8JUoZGShEvKyV2xZkbn6aTOb4AUFkQ1oOAbL5eKrGV9lJHlhX8i
         ikTUZWQeVg84PsaeF/3V18lwJTeMqwhobJ2eFptbjPq+hh2Jf7vWoeuHe2+f6l5HqmDE
         a4nNLJBwnXymAwE9U8f2sXN3HBHPU2EL/0MKqPc3u6xXOZwgEaF0LyJQOgIinFqruhSZ
         u+Ew==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=cpjopP+U;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=I1x7m8rYIM/AR+sH/8mnYsBeo4bHGG7wy82zGbxNP80=;
        b=X6bLM01iL3K3CqMgnQTa1bX98HdE/kZJFsJ4X9XWhyOICuXUzYszUSZv5jKZm5aKO9
         FcTxJBXMTeJEeOinLjlhauT4CBVZBVcZF9O/yhuThErgp2Piouwrfg038sPttsX/B9/F
         fP2fn46+T3u1BUwKHzR95Mt+RjIgYPlDUoMGMnGjlclvYAi9EL07JYNq66O0qV3nEd1N
         5GK/BwY+kCoIeFvViTMZ7Q4EWSPG7l5DpHc98+bzo2nXcwwfuk+sh9YnQBcVhbQhJXy4
         IMGlJkogY9SxXcpuDAv+OSaUbqxqUHMsGPw5mr5HBgoXkVEk7ymEwZf/k7cyjK6oJZ74
         L71A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=I1x7m8rYIM/AR+sH/8mnYsBeo4bHGG7wy82zGbxNP80=;
        b=RgQmdNa5fvb9gLRnErlPw36tpyVHiQ3/uy2sHQ0N5Lg66XM4DuVXLpvz58/iWHtKzb
         Ru0osyThJKffjAFHE+WdPRS2ycFxQaJmlGbP9dRe1iR2sJty/pSd0xahYm5bXJhVWlkr
         zbhkxITu1HDHHhTOP8mP8mekwEHwfMRc5/v23pFjJoxzdJo7mUCej7xGwF9HsvOlkAi7
         7eXbvh7cB6PZUBJxF+/UINBwfgQioTzKYF45DkkH78M2mA0IBLTUYfSq0hNCxRaEYQac
         4nizG1kbSir5SYv9trwmfg4KEcBiYUffUOczQNRJ7waqEuAQuV/OBAxyf4qY58r6tusg
         Bu5A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX4472PwtllS/0V9TS6XAhkHGsKkWEicV6hIy3s8/qNC/MaIU9X
	Un/6I8zjVb+7uiiTbiK9gyE=
X-Google-Smtp-Source: APXvYqzq0g6BUAlfQCAqMmZRX5RgeRfGDVUQEAduCgeN3gXgAqeRIaS9STu2y6qSxVcA2qQbNxoTLw==
X-Received: by 2002:a50:f045:: with SMTP id u5mr21561111edl.297.1569870834931;
        Mon, 30 Sep 2019 12:13:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:c797:: with SMTP id cw23ls3087041ejb.6.gmail; Mon,
 30 Sep 2019 12:13:54 -0700 (PDT)
X-Received: by 2002:a17:906:c4b:: with SMTP id t11mr20680328ejf.131.1569870834459;
        Mon, 30 Sep 2019 12:13:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569870834; cv=none;
        d=google.com; s=arc-20160816;
        b=Nh0GA3HqIiIds5Ph3GMgCqVsrlDcr9ynnLnY9/pX/E62U1IP4Mz/c7ZxXFYUMotBbY
         BdrXFelNYiDdl5mbAveFsPpa9b+rsH3urkhxP8ON0GPFjllEF+I6/jZrhNQDfXVL4w0y
         dlALgZIunHfMK06739mPMeqpG2MF3w1B97+uCRgP78to6YMNiIG+3tLZYUXTzOYzWWzf
         8tXeytp8sPxxRlxQtH7ee6GxK2mlCoCgGIA03jRkIVtNRSIuhxg8oq2nePhuj76U0eHf
         EebyVhqrPhZ/heT/kuEOuc2teoYRH2hjKwOGgWNFOQqGIJp64B5FP4p/G/h55wBZX309
         JCBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=DT7LHiy8l3OENC/wgVeMAgZLNOWaUtExFZTVuSkR2YM=;
        b=L/O4qMyKHxwZjBKGSkQw3nf9SibkbWYZnaIvAOVLA542cALMa9VINTcYo621PhgsxP
         zEKeTz83vL9fppfAbDnqzMDZ+WkimizxgffH/r9ZygRIOpt0Y1Ae3fQWsaeJADRf3Enr
         HaQkmeZ4pBn6H91HanMuMqCqvytTm6W6g9cBYON/CxRgvuwERX68QEyM4+rqTIgITbyD
         c9C08F/497/MWJvSB1XHSUMImnelcnirlUN27oIPYDm1FvZjxZ5WdodXRLPAPLVxw0ge
         6ZlwndbKgu0VXABbDH0+NhQLOWLOkFDxbSazy6r7NsvP6oKbhupE5EFIh4QymQ+n/en4
         d+ow==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=cpjopP+U;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id d11si582378edh.3.2019.09.30.12.13.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Sep 2019 12:13:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 46hsWk0vLjzy1p
	for <jailhouse-dev@googlegroups.com>; Mon, 30 Sep 2019 21:13:54 +0200 (CEST)
Received: from localhost.localdomain (2001:638:a01:8013::138) by
 E16S02.hs-regensburg.de (2001:638:a01:8013::92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Mon, 30 Sep 2019 21:13:53 +0200
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
To: <ralf.ramsauer@othr.de>, Jailhouse <jailhouse-dev@googlegroups.com>
CC: Andrej Utz <andrej.utz@st.oth-regensburg.de>, Ralf Ramsauer
	<ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v3 01/14] tools: jailhouse-config-create: Rename regions to mem_regions in preparation for port_regions
Date: Mon, 30 Sep 2019 21:13:09 +0200
Message-ID: <20190930191323.32266-2-andrej.utz@st.oth-regensburg.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190930191323.32266-1-andrej.utz@st.oth-regensburg.de>
References: <20190930191323.32266-1-andrej.utz@st.oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: andrej.utz@st.oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=cpjopP+U;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 tools/jailhouse-config-create | 10 +++++-----
 tools/root-cell-config.c.tmpl |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/tools/jailhouse-config-create b/tools/jailhouse-config-create
index 55601a6d..cfa7fbad 100755
--- a/tools/jailhouse-config-create
+++ b/tools/jailhouse-config-create
@@ -269,7 +269,7 @@ product = [input_readline('/sys/class/dmi/id/sys_vendor',
 inmatemem = kmg_multiply_str(options.mem_inmates)
 hvmem = [0, kmg_multiply_str(options.mem_hv)]
 
-(regions, dmar_regions) = sysfs_parser.parse_iomem(pcidevices)
+mem_regions, dmar_regions = sysfs_parser.parse_iomem(pcidevices)
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190930191323.32266-2-andrej.utz%40st.oth-regensburg.de.
