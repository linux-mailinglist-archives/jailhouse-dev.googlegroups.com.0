Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBY4K76EAMGQEU67VS4A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x540.google.com (mail-ed1-x540.google.com [IPv6:2a00:1450:4864:20::540])
	by mail.lfdr.de (Postfix) with ESMTPS id E04203F2E96
	for <lists+jailhouse-dev@lfdr.de>; Fri, 20 Aug 2021 17:08:19 +0200 (CEST)
Received: by mail-ed1-x540.google.com with SMTP id m16-20020a056402511000b003bead176527sf4680082edd.10
        for <lists+jailhouse-dev@lfdr.de>; Fri, 20 Aug 2021 08:08:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1629472099; cv=pass;
        d=google.com; s=arc-20160816;
        b=usJ92yK68/YSZuGLKf1Ojf/Vb6EAY7uTPXeNz53lZn+XN30AqBXwCP2Lot3pKwc/Vm
         3y9CZPSX2qZucXe3Dd8NZYCEX4NXU/9yWjLZ0MqAAAGnj+j7M3mVBNbd5AHIHex7b4s1
         jIvKDZfGw+ysTiYTPGkcZNxi3FQNTjG+bVwD0eAvnJPxlSzR2e8zVGiyTtJJWG9BQdQd
         DjVQJ18US2DVKZTbAvFc7izutnvq2WsBqrZ0p/gyvnp31lxbR3PaGJVhrDcXNPoZzrWs
         bklB13aC3O5ZBm3wKc0S/8XRHShiYT7AblwLXMGMWIruSN6CVDANjOlsk6IxyK8SptuI
         kl0w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:to:subject:from:sender:dkim-signature;
        bh=NV0vmh7ppi1LNzDqJviG/PsvkiRf399w57GM/CfuXx8=;
        b=YPNM6fr04r5gNulgIBIvIhgI/Esnm7nzR48+i47VEt4G25cdL7bozLFRDi5czqBYMc
         1K2i14ULIXZL0UGyO+jhteD0T5+Kans51ZzsY8RmKAUBxod+5ZLctU73ONXKvjoqdEI/
         LNveDI0fWW9eRwoR5a3HKsu73yP24KlEh0pWJF54EZiA3JSS3YiEVyWEi4hAx7OQYOjc
         zAlFwD06H+iikwHTTVGZCtLwbRoLsdNiN/gyne/2bLhslfBFu8a/YSu3HTFkOJsXs5QE
         2i1oTTbdNcnv7zn/0IC45I2Ol/XpxyduMa0BhwTAnIqB8qI7T2d5eYwEaETTjgljCngs
         aOoA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:subject:to:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=NV0vmh7ppi1LNzDqJviG/PsvkiRf399w57GM/CfuXx8=;
        b=PIj8EIDqbt7tF0B7aBNHmpOlRI98UJrGR2NHgoPxE5NMBf8rCxojnwmplXWPfZe/3G
         jXY04k5IxT4uFM7KkBNkuzjtahjXGD7Hf7AOVh9IArEWwLACvelaH+LSLKA8oOSsgTKw
         fD69aV/MUR52kOHwBNZ6SM6mpgj9JZ400OJBdLom/17Ln/4hEBMrIhqPyYbnu3C6Pp27
         aS0c29mAJpzBLzM/klX6gnls0Brx7EsV94UkN0otxtX/GKImiLxtKLVkjx0/q1jvCvqe
         wY5iC4g0ft7pUVDRggBV++EGq6U60gqXJTNFfFcPAF/zHvmzeiHAN6qHU+MzMy4Sxgyf
         8MaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=NV0vmh7ppi1LNzDqJviG/PsvkiRf399w57GM/CfuXx8=;
        b=gdPaEmi8U1mlDjHdcAbljZ+STtSj3Te5cfFNylLwDpQcyy/X2AFUlCHmb/EH2Hmh8F
         +IfeReVWpEg49EQycVYf5ow6/IbMaAMl2c5L2pSaj5++fU/I8iMbCn0cG2fH2NfPDhqk
         jxPgzLkq1MjfFmKpaQ9RJxxot0s6Gi5tN14YBJUkQD5u9IZMQbD1NYoqVEg8R9yxlptQ
         NsghgE3X3peopoS7zgsuxOeE/ZC/Emm9CmThClTp/EspzFhsIE37FrYq/FiDwxCabMXQ
         7t7pV2VF6H0aBpV7zNlBQYU4YVj9MxNAzcfCcB89CIAL73nTrBr2LADLAFkSG2l3DjRa
         ykmg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5334v0DLU+IffdGtQBoD4YRY61LnfD1vzT1/n4K+Kw0leOdd/ytw
	BylhFKNCqgZ0sk9PLKgf2uI=
X-Google-Smtp-Source: ABdhPJzTmh8EnF5orKSLFF8Ctxj7xkMtTtGrD7ylqOvEm0BS+Qy3eUbVwu3XtHnagZW7+Iuu1s/fCA==
X-Received: by 2002:a17:906:12c6:: with SMTP id l6mr22517268ejb.373.1629472099396;
        Fri, 20 Aug 2021 08:08:19 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:46d8:: with SMTP id k24ls4626942ejs.5.gmail; Fri, 20
 Aug 2021 08:08:18 -0700 (PDT)
X-Received: by 2002:a17:906:a18b:: with SMTP id s11mr22769812ejy.8.1629472098103;
        Fri, 20 Aug 2021 08:08:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629472098; cv=none;
        d=google.com; s=arc-20160816;
        b=dTlS4ivCmsc9GJQs9l9tDylzYtyyhk6vLdWvShlSrRjJfVA24jC0Nm8a7vrcn1QkMM
         wA+cHZvTUwvPJ5kFDDHYBKXjyLAcHXqjC1LDxGFqMYxKp6smTFuL4izG0ehpMthkCn61
         juhx8nSfIJ8oTDPZFedF+WIRpfeepKf1hZanPWmD8lYDhdn+XXbPUnsFQEGc0emp7nc0
         S9O1QHQcVLL4cTP7VU1PhTJV7nv/zSP5hgGPn6fTluBPvth8PpUhbgcLOy3q+zSQrIlG
         8BkcUeYKavuSdazd5OyLoU+PDwuLhWjh8OwKk5m9tI0yUFW5QrUEljoa+zr3+j+kktTe
         YD2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:to:subject:from;
        bh=ZmqQOyIuccIqpJd6UyMqlNA9w0kxCLkdwI91hFA6I/8=;
        b=QvoK5424cPvNsDAC6/i/YvwVhfvncYaiTY8/Q9GWnG9i+ZMuwKPMTp/dfWcDDQqjpN
         aDKEAXB4gBqfal4YRsZrTnQaFLfiAAsSZwxhVQ7m6vJW7u7spsB+Dcb8tuSr4ursGFs2
         9Pr2rhgC7Hi4xFRSCVDHQVodpU3iHeucTmIguJeKXQc7LZfNkuLY4NrkqMb32zEWSnmM
         WEFxxql7P17JPjrRVGm2cgnuK+Wo7IXLNP2Ollxy02zgxWi+aMr7jLcNerG2UVgYcLJ8
         jlOi4CYeUPTeJFb2PHqWPQtwlugJOsQ+XFmUV2jj6c05sSuCv4kZSPm7sqZcjiRCbZ9Z
         y09g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id qb19si319869ejc.0.2021.08.20.08.08.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Aug 2021 08:08:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 17KF8HZh013431
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Fri, 20 Aug 2021 17:08:17 +0200
Received: from [167.87.0.29] ([167.87.0.29])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 17KF8HVb024837
	for <jailhouse-dev@googlegroups.com>; Fri, 20 Aug 2021 17:08:17 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH] x86: Decode PCI config access violations
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-ID: <8f5ac8da-7007-ec91-9609-1a1cb7b15b83@siemens.com>
Date: Fri, 20 Aug 2021 17:08:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
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

This has been a FAQ on the list way too long: Parsing the address port
register content, translating it into the target PCI device and config
space register is not for beginners and even not convenient for experts.
So add a dedicated printk for this case which allows to remove the
address port reporting from the remaining ones.

This now gives

FATAL: Invalid PCI config write, device 05:00.0, reg: 0x44, size: 2
...

analogously to the MMCONFIG access violations.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/x86/pci.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/hypervisor/arch/x86/pci.c b/hypervisor/arch/x86/pci.c
index c979cdad..fbb8ebd5 100644
--- a/hypervisor/arch/x86/pci.c
+++ b/hypervisor/arch/x86/pci.c
@@ -194,16 +194,20 @@ int x86_pci_config_handler(u16 port, bool dir_in, unsigned int size)
 			result = data_port_in_handler(device, address, size);
 		else
 			result = data_port_out_handler(device, address, size);
-		if (result < 0)
-			goto invalid_access;
+		if (result < 0) {
+			panic_printk("FATAL: Invalid PCI config %s, device "
+				     "%02x:%02x.%x, reg: 0x%x, size: %d\n",
+				     dir_in ? "read" : "write",
+				     PCI_BDF_PARAMS(bdf), address, size);
+			return -1;
+		}
 	}
 
 	return result;
 
 invalid_access:
-	panic_printk("FATAL: Invalid PCI config %s, port: 0x%x, size: %d, "
-		     "address port: 0x%x\n", dir_in ? "read" : "write", port,
-		     size, cell->arch.pci_addr_port_val);
+	panic_printk("FATAL: Invalid PCI config %s, port: 0x%x, size: %d\n",
+		     dir_in ? "read" : "write", port, size);
 	return -1;
 
 }
-- 
2.31.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/8f5ac8da-7007-ec91-9609-1a1cb7b15b83%40siemens.com.
