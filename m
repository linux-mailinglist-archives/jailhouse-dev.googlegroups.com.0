Return-Path: <jailhouse-dev+bncBDRKPIXWWIFBBMUHQLWQKGQEE56MZCI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x539.google.com (mail-ed1-x539.google.com [IPv6:2a00:1450:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE6FD4126
	for <lists+jailhouse-dev@lfdr.de>; Fri, 11 Oct 2019 15:29:22 +0200 (CEST)
Received: by mail-ed1-x539.google.com with SMTP id y21sf5737595edr.18
        for <lists+jailhouse-dev@lfdr.de>; Fri, 11 Oct 2019 06:29:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570800562; cv=pass;
        d=google.com; s=arc-20160816;
        b=fJUWNGU2p9m33bDIiVmZBCVLp4hqEkoTo+Jd9h+0wFbbXABQtVK8IyyVjLloNJCw7w
         iDQu5oFos3y/Y3eE3stvM9pfYEBjU2mCGXRZQhesCtidPfgyfkW6oh4eXcEhhFRsC1Jj
         shNE/RkyJKTvqMhoUT1aMH2FvT4a84dt2OLgPxWEV8wVcOc1rccqCMm7GdBD4O4S4NPs
         hveCeo2YiWaMxlu4i0zEZytE+8jpWqyuR/GG2JcH4I+6f1JIWY32TfzD4DuErzvYprg9
         LbSC8qy0io0q4nGpzk70g2vkGT9YiDWzOCevCBu9Rw6iDPftTC1/ol9BnN9yrHl8Qlhy
         flRw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:date:message-id:subject
         :mime-version:from:sender:dkim-signature;
        bh=AcfzWe6qfUKL5oTK55AEWCShdGQ/ZHgrQU6d9uF5/Dk=;
        b=ZsEcUHeeseRB+RnuH5Bbnj/GDsPeSKT5t+EtmLgqn0RTus4rY0c699UNIJDqKg2Gww
         h18rfV3JeLkhZuTPN+NZU1gidW38IZG9xh8zH1BZcn1bRscwDmW97v6b8Duwv4e7UWl5
         plXSVZUd7hDFwu1C4J1M/E+/8f7JICg9fiP0DtXLcEMr8Vh6ik9m2Y0VTK3VC+ShLDkN
         ZQ5gtOAqGZfI7eteCH0U5nfUPKWDvep4kg2np8DBVqwTWz9FZ9d0il5pdx/4OG73MUob
         gsu66NBCxLxd0XLsnaSZ+q6DqeOO5oxd1AnxOTDk6TcnHd9wv/SFw/cHMaNfdVALsd9D
         d0HQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=RIUo1Hvn;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.17.21 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:mime-version:subject:message-id:date:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=AcfzWe6qfUKL5oTK55AEWCShdGQ/ZHgrQU6d9uF5/Dk=;
        b=aOqXPsFEa2YLi3q5IqZ030OGSkhgscZJGMvqCnGtOgpwVCIVsGpSfY+ztaoNVn70R7
         WFDgmc7BLEieE5SUlTdkFqya0Gl9vMWSsVTP8j5eE3MR6DbM3ZyQ62NBfnrRy7xCv8Ze
         F+RZYn1DmFp/RbZ4rMzgBDmpvz8vnAzCBN9yKr8kn+uS9ohY8qJ8/pfftdu+KpoBzrq5
         xwKvGc5KIXA1cjhpc5w/z1bijqSVuTNh2eJ8NFHthFtynnIElwmtOLlNVvKrMQvY+oeo
         VGs2KSjaLWzBHLmQkDSMgKzDKO/hZ34pmJqpynlOKHEMpCntl27Ow8Wg2ERq1W/uNrji
         oZPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:mime-version:subject:message-id:date
         :to:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=AcfzWe6qfUKL5oTK55AEWCShdGQ/ZHgrQU6d9uF5/Dk=;
        b=KAT3/qHg8zk/2zWAZE42TC0Z2KKjDCiDssHGUa9kqOMMBzANQsnbjYaigff8l+UMo6
         ORh/gReEzw3OLKhRu8ypOELEgFdzHIcHHfPL6JjqwWvf4LCLEGoKtLZ1duXoKklCPQFx
         y+u4Y41zZ5Qmmf1GdZf0K2CBRKyD2pKSLHYxkdiriz4D8RgdhC1Cd6YAuyMqvUeG2oZq
         SwlRcsCyda6pHPYkpcTnJnbhy6+z982OfYBg7W1hcnDUsvhVZWv6iYDUI4ksW2KVrbfa
         GSA9Q6oahR/ywbUaFtnfFFYj5oR48MjIfXlMwSrIoqANiekuuw8UnsZeEvWNkwEr8a/I
         ILKw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX2yt3HjdYWVEiu12uxpPePtETXD4zR5rF5J1Enkuyy1oU07VyV
	39s9yRdAnLOEH4fnhMvrdRA=
X-Google-Smtp-Source: APXvYqzmCViSk8O7eib59UaPJVqKK4ylXy5Rm0YpTxrTTJW3w/fdIhIWaoccX1myYjNeZg8JSRoPEg==
X-Received: by 2002:aa7:d4d9:: with SMTP id t25mr13602803edr.76.1570800562402;
        Fri, 11 Oct 2019 06:29:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:d98d:: with SMTP id u13ls1729229eds.12.gmail; Fri, 11
 Oct 2019 06:29:21 -0700 (PDT)
X-Received: by 2002:aa7:c603:: with SMTP id h3mr13524643edq.44.1570800561612;
        Fri, 11 Oct 2019 06:29:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570800561; cv=none;
        d=google.com; s=arc-20160816;
        b=Y0CnfB0DfRKuLPQUSk2XkNQ8T9shv8xmzfzYuYQ1sIXkJR+TPT5IaJRx6j4tzRsrWt
         tuYH71oIWrIYxO+BpaVhF25dZTJukZQalplIqoJLKqkzUHoV+5AC1F4CXqEGjZa3/b3e
         u8GP4kmSg7vv3gBFUxBmpoHe3NtuT6GiQh4jqgzXs5qRpIK7CSL5qdr/GV9T+TPQOs8v
         bJvBDzNvJ7xq8fDBXOOY13e3LnwHYBpvBMENgTMRfze9ijUOYMVrzdcQwfhyaOX12bHL
         0q0ygNS+Fyl/iupEbxGF3OxGazqs7ZmTD+SBy04jLFVbrERe84CSFLBdx+xe3eBp7XMh
         sq6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:dkim-signature;
        bh=jzBKEgYey0B6vE5MklhYUOTEkrc+qWNdUD6pcC0hxTg=;
        b=qzh4cU8gCu5iluSnaCuk64BjYERJxdIOValqRh7CZCQrRMFq9ybbcZ1KDXjG4n+kZK
         hDVSZAq7pKdTEuS/RN675gqsErqhYLsIXI8trrCtWzhN2gOhq/6OFV1r+d01zEglW2Jv
         GZXU9BemmNxXMAZXG86ibUwaWIgn5iG1iMpB5m/0FnHSDjRdH0doDXYwFwB2vPcpp9ow
         Jows0X4aVTP6psDE26Qellbmli3eWEB3Uq3DRwLTqYBsHlIw8PrbPOSqpJPhnlg7bh9J
         f0i+4HffAu0ncpt0kWB/G/CnokgX3SntcszaR5/CkigPJcrzQ0pVMlmqVV/PZpvr13lj
         WGkA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=RIUo1Hvn;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.17.21 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
Received: from mout.gmx.net (mout.gmx.net. [212.227.17.21])
        by gmr-mx.google.com with ESMTPS id a27si200266ejg.1.2019.10.11.06.29.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Oct 2019 06:29:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.17.21 as permitted sender) client-ip=212.227.17.21;
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [10.0.0.213] ([212.126.163.234]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Msq24-1i3SUz0ZoW-00tA0I for
 <jailhouse-dev@googlegroups.com>; Fri, 11 Oct 2019 15:29:21 +0200
From: Oliver Schwartz <Oliver.Schwartz@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: [PATCH 1/3] core: Add configuration option for allowed IDs in SMC SiP
  calls.
Message-Id: <5115AB43-CB92-4FA6-A377-50F3243639C0@gmx.de>
Date: Fri, 11 Oct 2019 15:29:20 +0200
To: jailhouse-dev@googlegroups.com
X-Mailer: Apple Mail (2.3445.9.1)
X-Provags-ID: V03:K1:c+b6zsJUvr0dsOXzAxuG1CCZjcD29zIeqMzFIGY7/3ZkokiOSzQ
 rJ/wwxYmjKM4Or2oQb8qEAp6PXnFnJ3l2pI/SS66t8H0EfXGGiBS9T/EAzgnqi7wskpAjyh
 PnWbRjiEav4Qc5KaOCikjC/9YAmOauyBRSRW3s16Pj6iouSaCSKVFrFgpYirmxOy5qPVnfh
 +Z5u5rLKvUsfv6bQ96b+w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Nd3mUpK8/So=:ZmXB5YpFmrr6qvQq2BGwHv
 REe97bpTPe+I4uWrr0YSmbD53kvgZRppzvmpYS4C9BEwefUVf6PtghQlHq7bPiI1xyi7OvafZ
 f7IRSeY9kPIHWjsbLEAr4axJ1urm7yEsUjbYw9q2ot7u3nwkWDUDHRYhw7stvm2a2lNeu4IPj
 8kHTh9oxsxCzJV9SU2kuHe2YccY3dub7xdOyhPYskeQ7Qy+OshBgl4SlMkr4B8TQCb0vYQ7Gj
 7MFdgjs3axdelm/5W638N+Znf1H9BvTVCoN/RJ79RokTWloda+gtUYJyqEIjGrataX4YnK+JE
 MC1sh80mBry187MAY2UMW4fqiovKPc1xZ2loryLpqrvElXnV7GucY8W97iqI5BRJYkXRDgw9Q
 diCpEbaTjBba3MCKA3tW4q+5YhDSD74zry2ODIrK/Y/ed2h9mG7dtbZEHQlzAriouKcUK7ZF2
 hIzajhdTbjAVxkuRfH+JrRsng6K655lnfW2m8YZpvZcqtY8Wuyim06D9VBxLaxXSTUKps/0M7
 nMPEwWZ8PvP2xVEYUJ9eODdVntErQY7VmYDMPE1N1+fsG7kIi18sLr9sqcdztA/u7vNzeAkPQ
 c98jxVMUQXt+LEhCnsgh7Em+SdlhG3/2wQtd0ADt8he2jhbLNtXXabCw5CmJVPcRtTMSlrLh3
 6hO92Xjhv85l1pNGIZEwwfuIYHZ+duRBUNGR7Q4mkTPKmL5e5+iaAI7ly9ISkIh0VpaUIO23Y
 +ieEzBmMFcDBHfCt6kIuXmlPKtDIDzxizKIgu9jxPma1UxVNSVsz68A2kNg+SIBDMTgzh9or/
 vs3lsp6s4Za3KJs1SJntKNavXtvXZRSIZN+om4sBp1sceJ6ACcqbzmQ/32tU79ps7+jfxFaxZ
 xDyBP+HvM91eCUQtGPJGr/spSe3OgiQ85ODAAIY43YmEiLO5O76N5770KuAvd8KZm348c4qc0
 ZTKQuAc/C3rTJKzQtAH/KMOqgodn6Y4jPpY68cmBf9pf5vQhCO7kpMgeTabO0ESZX+D+CrRUW
 JWsRRGFXe/z58kueKfkL/jnZGvaAfB0yOIpMcH1r5LnUHHm6lmZ4wYZT6btZq1W1tbs3X3HfV
 DrC/5yZl7lzQGejnLCL8O1GcNSnXUr+IWUk/faI5LrqZ7xN2wpri1V1Mr7d3SQhEIPck2lpq0
 0fXvkzwDGAQNeYqBpMQY18oqUT85ApYXTfHXClU6HuZfK0npHHFBTv2uGsfdhf30E4njKJFZ3
 nC63KZFAVXYc4GAu25i49vfRPRHbDvfVLpk0HHLvDw3e0NFuRC0J85avpsy0=
X-Original-Sender: oliver.schwartz@gmx.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmx.net header.s=badeba3b8450 header.b=RIUo1Hvn;       spf=pass
 (google.com: domain of oliver.schwartz@gmx.de designates 212.227.17.21 as
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

This patch adds a new configuration parameter, allowed_sip_ids, as an array
of integers to the cell configuration. It specifies the IDs of SMC SiP calls
that are forwarded to the ARM trusted firmware.

Signed-off-by: Oliver Schwartz <Oliver.Schwartz@gmx.de>
---
 include/jailhouse/cell-config.h | 13 +++++++++++--
 tools/jailhouse-cell-linux      |  2 +-
 tools/jailhouse-hardware-check  |  2 +-
 3 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index d435b9f..3a61e4b 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -50,7 +50,7 @@
  * Incremented on any layout or semantic change of system or cell config.
  * Also update HEADER_REVISION in tools.
  */
-#define JAILHOUSE_CONFIG_REVISION	12
+#define JAILHOUSE_CONFIG_REVISION	13
 
 #define JAILHOUSE_CELL_NAME_MAXLEN	31
 
@@ -98,6 +98,7 @@ struct jailhouse_cell_desc {
 	__u32 num_pci_devices;
 	__u32 num_pci_caps;
 	__u32 num_stream_ids;
+	__u32 num_allowed_sip_ids;
 
 	__u32 vpci_irq_base;
 
@@ -291,7 +292,8 @@ jailhouse_cell_config_size(struct jailhouse_cell_desc *cell)
 		cell->num_pio_regions * sizeof(struct jailhouse_pio) +
 		cell->num_pci_devices * sizeof(struct jailhouse_pci_device) +
 		cell->num_pci_caps * sizeof(struct jailhouse_pci_capability) +
-		cell->num_stream_ids * sizeof(__u32);
+		cell->num_stream_ids * sizeof(__u32) +
+		cell->num_allowed_sip_ids * sizeof(__u32);
 }
 
 static inline __u32
@@ -362,4 +364,11 @@ jailhouse_cell_stream_ids(const struct jailhouse_cell_desc *cell)
 		cell->num_pci_caps * sizeof(struct jailhouse_pci_capability));
 }
 
+static inline const __u32 *
+jailhouse_cell_allowed_sip_ids(const struct jailhouse_cell_desc *cell)
+{
+	return (const __u32 *)((void *)jailhouse_cell_stream_ids(cell) +
+		cell->num_stream_ids * sizeof(__u32));
+}
+
 #endif /* !_JAILHOUSE_CELL_CONFIG_H */
diff --git a/tools/jailhouse-cell-linux b/tools/jailhouse-cell-linux
index e43f8e4..b76bdc6 100755
--- a/tools/jailhouse-cell-linux
+++ b/tools/jailhouse-cell-linux
@@ -574,7 +574,7 @@ class PIORegion:
 
 class Config:
     _HEADER_FORMAT = '=6sH32s4xIIIIIIIIIIQ8x32x'
-    _HEADER_REVISION = 12
+    _HEADER_REVISION = 13
 
     def __init__(self, config_file):
         self.data = config_file.read()
diff --git a/tools/jailhouse-hardware-check b/tools/jailhouse-hardware-check
index 37e02b7..e107bf9 100755
--- a/tools/jailhouse-hardware-check
+++ b/tools/jailhouse-hardware-check
@@ -136,7 +136,7 @@ class Sysconfig:
     X86_MAX_IOMMU_UNITS = 8
     X86_IOMMU_SIZE = 20
 
-    HEADER_REVISION = 12
+    HEADER_REVISION = 13
     HEADER_FORMAT = '6sH'
 
     def __init__(self, path):
-- 
2.7.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/5115AB43-CB92-4FA6-A377-50F3243639C0%40gmx.de.
