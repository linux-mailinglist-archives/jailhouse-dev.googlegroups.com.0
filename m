Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB7XIZT7QKGQEGSSHSTI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x338.google.com (mail-wm1-x338.google.com [IPv6:2a00:1450:4864:20::338])
	by mail.lfdr.de (Postfix) with ESMTPS id 20ED22E988D
	for <lists+jailhouse-dev@lfdr.de>; Mon,  4 Jan 2021 16:30:07 +0100 (CET)
Received: by mail-wm1-x338.google.com with SMTP id 137sf5093967wmb.5
        for <lists+jailhouse-dev@lfdr.de>; Mon, 04 Jan 2021 07:30:07 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1609774207; cv=pass;
        d=google.com; s=arc-20160816;
        b=GJeDBjRZCYuCwpUWomDOPsTJz3XJkQSWO77JVPn1dYA8S0PLicJEcH0rptR+1zFRf8
         WJuUcRa3h9HeAhwiEaGNGQbE6rBtQXSxDld6j1W7RVPzXwPynu8lVtxHnYFnpG7DXtHv
         2p7TgXwNu+ki/EsiVarKpGydhkNL/X/6xKc42AP/qW5QRsouh40+xyAN8IM1q84Wj4Nz
         i6CrPwWCJeOUF+5RD5/5vgaUAnLWHl2T2pq54Wd3oAd9sb1G1spVRurQTJjkwpU+e0Ln
         lTPe1Y+0UdFgPDFFkpXX/pfz8wAv3f58S0Kvpso1WLcUJ/PfTffQ+fwNSOKbT4eZkZvB
         sAvA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=ckBmJTFIbB86dCTPnoNi+aSdMhGBpCRtl68ejbeS3+A=;
        b=ZFOTE21zloP4EnQ+5oLFZcKGRve/nKmfaUNWV0it9CtlNsqpFmhDUBxDDPztAbUEae
         o2vpjGzleK8GdKPvz+T5K+FJZJogv2eLGSfdKDOtgdJVfDQ2FFR7LL/UFhV8FE9Sb4cH
         sjC6qMtIt9Fdf4thUR+FMYz3HlT6bMowvII1l+mxrpTUwhmbqeFnU+UPwJmzsE+b+Vue
         jqao9T6mKzKghY5DeLS2bYYSVUpgvONuQKGne9r7uVlIECc0svzTjIqxVp2V3jtS2a7A
         lbs8c3bOCATv/dIwdPE4XwK0Ps+Iq2sJcIQlXW//5cLkq5OVhJ/y5Qcm6mFhjP7tB6qn
         zCFg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=Rb7qTn9x;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ckBmJTFIbB86dCTPnoNi+aSdMhGBpCRtl68ejbeS3+A=;
        b=dl7azaGq1Fdx27MVtLHcUp/SXRThNEzSs8Ki05FEYqC+3Ha1OkjSIQPBzQy3v2R/XA
         r0ZJmlVRftfZpR2kT9kFIWZ/G6NMCDFSVCrs7uFYwqUx5M8jJnkBlNVPKGnS1sTjukYZ
         v4AUrHOrRe+tQp3/P4xSH9evjEoHAWpBpZQHgeHRDCXlZFNioD87pH87Hc5cf4XHxY4F
         6SxDIipR6VFhoEvbIRtuAPod3jTGKD+uQ5uJvKbsxGRgxkxWMDk+4UnK+lJ0WxHuDNnD
         wzdpM55i6RJGq2OuWwDnpyn2KGzEmpaMN6JuFKqglNu7gnplDmKyPtTx3pPrwFdNycGV
         TrEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ckBmJTFIbB86dCTPnoNi+aSdMhGBpCRtl68ejbeS3+A=;
        b=DQNMDhpt6EmXhaDykpuYbBeqRJOfrTfI+7X0DUBtR6nrwKoRRAUKWzur/wdfHf4jNO
         nDt6LO/lvmj6vkfq0oF7RR98NhvNlxwePDHBE2qux9abPKzpckIfvhLtSa7wVsFmiFpX
         YeFniCrnSWY7+EHg06BRvzzkcoM8i3ZbXjsL3piTLzdnp2v8/RPRYIXfxqB8vkWZMfsd
         TTYOtj9y8CJKLXrzIiZ5yuUkFDX9X/oRjsIJ59w9LKttfFQJoMSKg7t8PEwJTnlMK5PM
         pcZCBtY769cUBSLybtUeMlMYu0XJIF8xJsPoNbMd6evStB2ovnK7/UzcJLpQPYgxWmz4
         +Wqw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531awziIe32+N/LJBNFnO4E3rQcqap2HLAzFBeNGLdeHuSX2/k11
	fuvcScYxJx2tfz/vdqpQmHw=
X-Google-Smtp-Source: ABdhPJz82z37iWlXYEYumhmu8Q7QGDIT+uKjgwIeoglh0l1QaFkavdYvGAY8b+B/rbN7E56diEduXg==
X-Received: by 2002:a1c:7f8c:: with SMTP id a134mr27650081wmd.184.1609774206910;
        Mon, 04 Jan 2021 07:30:06 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6812:: with SMTP id w18ls860691wru.1.gmail; Mon, 04 Jan
 2021 07:30:06 -0800 (PST)
X-Received: by 2002:adf:eec6:: with SMTP id a6mr79914699wrp.239.1609774206081;
        Mon, 04 Jan 2021 07:30:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609774206; cv=none;
        d=google.com; s=arc-20160816;
        b=wUxL/Bure8eVwnv+0JkPTAVLZ+ALQa5Ze5G7/bTtFAobc5L11ePU8wF+XwNUT8Mqyw
         cvb/HBwxhUBoSkk6gcKRzb4Go9poTNHfwhQhcqknCzxnrNnSBuIxFtFT5lFqTp1G4g9q
         0JPKOsI9/Zy6V+oDephxWHJ3MSFtyYt757SZrUS1TmuKbWaQfop0CGKKVP3pkksbSc9G
         dXeC/27NDK4UFm0j/ionHGt9wpIkn+jUpYAsqoZQ/JVUEaj0QQlwJ99yb4HID6ufqXJd
         SjwoiJVv0+eNIROtcunceyp0qiddg/d+d4SgBNa/RppJtxRDDpw2gBxuq8OeedQ5BZBg
         ussg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=Gco23VhJzJhQlj7Cv8uUDUQ+Dv+DEmalIBnxGadKYOM=;
        b=JHVF9IVg2Fry6oQ+OgIMp95Cc0pBXOWTxfJaC+aXoc9/Bqfyl4K6Xhrd+/tSHKEwhi
         T4pmvwT5+Ud1AT/4uZG3sAH0WjY/x7RGQsGdMpzkmfBA6fBWYOULTVxuIabZcabG7q07
         IKia0j6+r4+pKBNyHni59SKljUi78nsd0IFCgfNc5MDFC8UMoYQcuqdFqr7pYrNpJUoK
         B+hfKzdu1aAiA2gV43jvn8v/t9Qb/4dJMF2cwkGDikGiQUDL1k42nvAfMMhLiVtajDEG
         S50Godl3brrSr8lvxynhgeMhFjrBFge5Hj2E/Ngu8LorNh/L2k9xgtesYOKk3UaeyN+W
         nlRQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=Rb7qTn9x;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [217.72.192.78])
        by gmr-mx.google.com with ESMTPS id 18si6046wmg.2.2021.01.04.07.30.06
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 07:30:06 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) client-ip=217.72.192.78;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([88.215.87.53]) by smtp.web.de
 (mrweb105 [213.165.67.124]) with ESMTPSA (Nemesis) id
 1MLifq-1keuvF2kq0-00Hk8S for <jailhouse-dev@googlegroups.com>; Mon, 04 Jan
 2021 16:30:05 +0100
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 9/9] tools: ivshmem-demo: Account for basename modifying the input string
Date: Mon,  4 Jan 2021 16:29:59 +0100
Message-Id: <9325b765d1ef16af3ad6e84f6dee872cd9e553c9.1609774199.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1609774198.git.jan.kiszka@web.de>
References: <cover.1609774198.git.jan.kiszka@web.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:l3FHFk5wdcdI5w7f7WOHaJFZt6CfVZx0CpcFYTEXXK9iXXIRUF2
 WM0+kb/FV79WHJhjt7Jew/nyDauQYQNjg7OFtdLJETH4vkMai6BaYvyJSmtI+MpNcpJ/RiE
 ewRbPZIMFyiApinrrUjBRf+C9T/kU/d9I1Yx1lY2ekcQyn73nzliwOuGQ8zRn/ZoZzVtw4B
 q3YCETTuv4Bla+4xDOQdQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1E9ZO5JsUBs=:oSA0GhakSF5nHl9UPqS9ZR
 QkqoPsik9w/FDJ+Mp1lOl257mWkybN/uejM4YNaD71xQRwsaCLr735gh1NdU6y9nGUaYXtaXX
 y3iZvvqjUML8GbELk30lPHJWxRZkZQVHY7ooU6UwgKpnzABn1qAKHC1tkRNutuJ1GGDOEJbKh
 TIY35NZeRMYpvJ+dMl7mclXn52oG7pmh7podXDQ7/LX+hiT7Avs5KJDuziGVmACXZodBRnmqx
 GYv694zIQD23BsFF07FZ9Z4RBvE9aBmTERw/GnCtMsMg19GoD66Q6sUxX7YDLzEN9jc4csRJI
 2sqXbnZ1uqX5a9724XgD5ofGS3ubCR99TLwqa7GNQhP+MoQ0lDqov2BOLYzwH9yaCANvaDRzg
 taqbJUV2pEuiXY/sDvhRYUPwDx801n2S23c4/kqkbep++MPeoAWAKavOg7RhGc2OBqm0XBH3j
 R3vTLreU1MJBPLtsWNc8Mlxj+19OQU5hJTquW9KVFvwXAv8PYKJVT40cgRCvjks5iDiEeWWWW
 rZOqoRI3t+ePIEFK19beS1H7ERHw4ZfsVhfTWWostPmzWU3IYNP7bDroWf6JfW22VRJ+4+OC5
 ziT+uQR7nmjK3ZzqmRBsgF8Y474QHMv1HhvBlKzUPXqTagrpDERdI53lC6Y1sWvfp10teg1AS
 3+5vFhQcYfaYJvgvk9OokFlHj37y4p3OWS7Te+T/2dUpExD0j5wPVMBIRUXW+0a+UxCw5k5LR
 wURyxMpHrD6eh/svAwwQtmaX9XV3/W+Uay83FygsvQI33dzVKlZT33XnXDkY6NR3gNm0mZwfI
 4HtMAMffp5NCk5gD0nrzBPWd8HX+x0dgexbJo8cGKjbU5S5yHjhLHUnPyxhHHyjPWnamzgfEI
 ub5Y3SvM3cCF6hdiB50w==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=Rb7qTn9x;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=web.de
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

Seen with uclibc in POSIX compliance.

Fixes: db3391923c0e ("tools: ivshmem-demo: Adjust selection of interrupt target")
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 tools/demos/ivshmem-demo.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/tools/demos/ivshmem-demo.c b/tools/demos/ivshmem-demo.c
index 5d3c333f..f9ef438e 100644
--- a/tools/demos/ivshmem-demo.c
+++ b/tools/demos/ivshmem-demo.c
@@ -45,7 +45,7 @@ static inline void mmio_write32(void *address, uint32_t value)
 	*(volatile uint32_t *)address = value;
 }

-static size_t uio_read_mem_size(char *devpath, int idx)
+static size_t uio_read_mem_size(char *uio_devname, int idx)
 {
 	char sysfs_path[64];
 	char output[20] = "";
@@ -54,7 +54,7 @@ static size_t uio_read_mem_size(char *devpath, int idx)

 	snprintf(sysfs_path, sizeof(sysfs_path),
 		 "/sys/class/uio/%s/maps/map%d/size",
-		 basename(devpath), idx);
+		 uio_devname, idx);
 	fd = open(sysfs_path, O_RDONLY);
 	if (fd < 0)
 		error(1, errno, "open(sysfs)");
@@ -88,7 +88,8 @@ int main(int argc, char *argv[])
 	struct signalfd_siginfo siginfo;
 	struct pollfd fds[2];
 	sigset_t sigset;
-	char *path = "/dev/uio0";
+	char *path = strdup("/dev/uio0");
+	char *uio_devname;
 	int has_msix, i;
 	int ret, size, offset, pgsize;
 	uint32_t id, max_peers, int_count;
@@ -115,12 +116,13 @@ int main(int argc, char *argv[])
 		error(1, errno, "open(%s)", path);
 	fds[0].events = POLLIN;

+	uio_devname = basename(path);
 	snprintf(sysfs_path, sizeof(sysfs_path),
-		 "/sys/class/uio/%s/device/msi_irqs", basename(path));
+		 "/sys/class/uio/%s/device/msi_irqs", uio_devname);
 	has_msix = access(sysfs_path, R_OK) == 0;

 	offset = 0;
-	size = uio_read_mem_size(path, 0);
+	size = uio_read_mem_size(uio_devname, 0);
 	regs = mmap(NULL, size, PROT_READ | PROT_WRITE, MAP_SHARED,
 		    fds[0].fd, offset);
 	if (regs == MAP_FAILED)
@@ -138,26 +140,26 @@ int main(int argc, char *argv[])
 		error(1, EINVAL, "invalid peer number");

 	offset += pgsize;
-	size = uio_read_mem_size(path, 1);
+	size = uio_read_mem_size(uio_devname, 1);
 	state = mmap(NULL, size, PROT_READ, MAP_SHARED, fds[0].fd, offset);
 	if (state == MAP_FAILED)
 		error(1, errno, "mmap(state)");

 	offset += pgsize;
-	size = uio_read_mem_size(path, 2);
+	size = uio_read_mem_size(uio_devname, 2);
 	rw = mmap(NULL, size, PROT_READ | PROT_WRITE, MAP_SHARED,
 		  fds[0].fd, offset);
 	if (rw == MAP_FAILED)
 		error(1, errno, "mmap(rw)");

 	offset += pgsize;
-	size = uio_read_mem_size(path, 3);
+	size = uio_read_mem_size(uio_devname, 3);
 	in = mmap(NULL, size, PROT_READ, MAP_SHARED, fds[0].fd, offset);
 	if (in == MAP_FAILED)
 		error(1, errno, "mmap(in)");

 	offset += pgsize;
-	size = uio_read_mem_size(path, 4);
+	size = uio_read_mem_size(uio_devname, 4);
 	out = mmap(NULL, size, PROT_READ | PROT_WRITE, MAP_SHARED,
 		   fds[0].fd, offset);
 	if (out == MAP_FAILED)
--
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/9325b765d1ef16af3ad6e84f6dee872cd9e553c9.1609774199.git.jan.kiszka%40web.de.
