Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBNXD66BQMGQEZJAVIBA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id 8185D364CDC
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 23:10:14 +0200 (CEST)
Received: by mail-wr1-x43c.google.com with SMTP id t14-20020a5d6a4e0000b029010277dcae0fsf9625896wrw.22
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 14:10:14 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1618866614; cv=pass;
        d=google.com; s=arc-20160816;
        b=cGzRnpf4kfiwb7+n5NaZS0xTien0SVzoRV52iW4LyWX3rNOYLSmbZYSQY6rQqer0kp
         ywgFrxcZnFC7rK7tKyC3CQ8Au2tZBV1FCx905zNdPHPLWZjqrj3/R7NZAjPo2pH+rdK2
         0U2xxn7m4J7+zBu3RJapESgdb2P2gcpr8jvzxzTwXjY5kb+yN/DXHtc75Gx4pKGgDDjt
         hgrjWAjNr4kIzF5tzdXharJDrGPd5uEcc70dd7jU1W5poCcGqkXAD//0dE9NUTn6fPle
         dFASZ3vtOaYsaC3xro0dZYUwVKKg72cZmDLEsoTJgWXIzJZQuuKC131Snm+rMa9zV6D1
         IJyw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=RxkjyrcTfNXEY6AzH3sKCyu2a0YmNX61lynTOG9p5X8=;
        b=G7JEfn4Qst4AN9w+vM2dA0ZQqR9FBesd3BtzIOEFMH3RA38knCkYMJKszgEgLrfmPu
         Ti5FJvh6Hf/s04M2nbDFyYydhEnKYVETu8K8TYYjcTm9wo84GoWmbCZmkGtKnueqA2LV
         b5wFVc3i46AZFl74MPWLXyG8mgeG3UKCvcHqypV2I+6/nFKjm4HN83rpDk65wqlGFl54
         U01w3F9KV7wcG4K0/mLCaA6XeU5OtHoiu7y7aJwmO3jPCs0b7Wnn6dFr5/1ufHtco+IJ
         RVFm7PWvavqAyayTgdsBg8VplC5ZNqbbi3k9VA0p7tfDNLce8dmjKCBf0L9WqDTXLs89
         azpw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=RxkjyrcTfNXEY6AzH3sKCyu2a0YmNX61lynTOG9p5X8=;
        b=ZsQz9Rqf2NaKvq1FsrO/geDMuPGsW7xF0gRwmxOURhL4hPW87XX23sI4IeOymuTvzE
         YQ0vrkJIxpB2QXjh8pmSHB+1QX1JEK6W7cYzYPUbaETwPm4JrMX5vJd+UfJwlyujIiSO
         JAe6tqmadqqfLBCnxo5jSeq5rELWjCe4T9RPxPs+upg5rE749Mqvnn0acN6J3rdI58Jy
         mEnCqaUQTC66HVtasEz55r4nSDLn5gSC6CY078r78Du3aSeB31+0bqhKEyiP8+R+CSME
         aGh7dUO+6omZDZ1x6+Qa0iR2FaS+xPIxfcISajRT1qOcFrjWael5U2ILEeoHBpkSKqU6
         S4Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=RxkjyrcTfNXEY6AzH3sKCyu2a0YmNX61lynTOG9p5X8=;
        b=NdEBV6vkPYJDq8UFdF1M4jgu/SHmYCoSCq79drbIR1t8yKblpIYDwg57kCSPkSLHsI
         hRemA2k27tDLVHgw19LVBYlALabt+hmG+RKbzMI+LwTAFB2G9DZNgOFPFlK1mPESGgZ1
         sAS0BR/UtNKX5LGrM8B9aNRZx7qerJKspdyVY1uUOesexStEo/jJ2mAIJBNaKJoa0iPf
         AHDwxUXEZd50yMpEsI09fBa+t8dp6+ZKq9wA5wr7aQLub4FGj6i9fDtx7egFltsxKI01
         HyAxMmji6FNrtuCoLasuWbdsZRHfh2krtPpE528ozixKKCoXNi/4BLIWw6y7lIKtYJrc
         dKTA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533EU2kqffoV/DIHGByCtxSXretPxzxfA/r3kc+3AhbsiJOdwIGv
	egHtr908XNb4D/jbmXdVuh0=
X-Google-Smtp-Source: ABdhPJy5fbfsT8AR7rVRCJdl3z1XK/w8K9KMrHVGJIKhqtWYJNpr6OYKYfR25lticBh8P8JqKA+rdA==
X-Received: by 2002:adf:d20b:: with SMTP id j11mr16780903wrh.292.1618866614323;
        Mon, 19 Apr 2021 14:10:14 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:c205:: with SMTP id s5ls298272wmf.3.canary-gmail; Mon,
 19 Apr 2021 14:10:13 -0700 (PDT)
X-Received: by 2002:a7b:cbc4:: with SMTP id n4mr946618wmi.153.1618866613439;
        Mon, 19 Apr 2021 14:10:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618866613; cv=none;
        d=google.com; s=arc-20160816;
        b=d0JA8/xeRJVEV2+czM2Z1ax6aeoKJ3Ew8/YK8eSH0U/oaspehtOg4SK/EUlY6sqbN/
         ublTaiytAfLcSISlVqi5Hx0JpZp5oN3TM+MlttnoY6CuDoY/OJucR67u5NuZZ96tNWHe
         EPFBEI/svUE6NwqsicFv2KqxWcEV40tte1B/5AdwVcI+zvmiAbrJGdX6E+1X0OFuQL0B
         ftH4JJ14APRSTODBIsMGYdyR1LxW4JanS9ZCprRMfhCooHNvCWfaNJ1ScFxv0sIy0DhD
         xupoltu1loNwPNBNcV4iQ/KEW6kCzJ2ccCl2q1nBvRdICnLeKquAr2LmJLjhIFLfCs0Z
         eiZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=elgPq/rs2/uIw1oRsBMHdt+EWo/R9Ma1OazjtpJrcek=;
        b=pi7s15jJj39RcQYfd/iacqZdHL9UJSvHgsFj4vXS5UDQzge/25PNiUgPtclztJK0Zs
         AqVNOKnYUzn4ExTusb2hHXQuq00DJcfz4JpL0PjWKytEiB9v00YDYA7RItcLBsQfdJDC
         YKAMlKhRf0U8szum7+vHSQO/VNXJYmPOnUTAnaa1xMR0Bd6DOiRR+77cUN4OrMY7vvkP
         2zOh6p/+yB4cRRp4M8LqS4T0YGkcfmUqfJ+x0DUnYvLejGUmmugmPaKG08rOhSgbnWMB
         DPJOyQaVRJUZyw6HlPpzfDhZnWQ8LaxbzLYwK1ol51EZp/1OTR2WwFtVEjNe3wOn3Qop
         cWLA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id s8si1445288wrn.5.2021.04.19.14.10.13
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Apr 2021 14:10:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 13JLADGA026878
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 19 Apr 2021 23:10:13 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.240.116])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 13JL6TpZ015242
	for <jailhouse-dev@googlegroups.com>; Mon, 19 Apr 2021 23:06:31 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v2 06/20] customizations: Add QEMU ARM
Date: Mon, 19 Apr 2021 23:06:15 +0200
Message-Id: <001ddb8ce88f3c98003c408bad463edfd162792e.1618866389.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1618866389.git.jan.kiszka@siemens.com>
References: <cover.1618866389.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 .../customizations/files/.bash_history-qemu-arm    | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 recipes-core/customizations/files/.bash_history-qemu-arm

diff --git a/recipes-core/customizations/files/.bash_history-qemu-arm b/recipes-core/customizations/files/.bash_history-qemu-arm
new file mode 100644
index 0000000..39aeee9
--- /dev/null
+++ b/recipes-core/customizations/files/.bash_history-qemu-arm
@@ -0,0 +1,14 @@
+jailhouse enable /etc/jailhouse/qemu-arm.cell
+jailhouse console
+jailhouse cell create /etc/jailhouse/qemu-arm-inmate-demo.cell
+jailhouse cell load inmate-demo /usr/libexec/jailhouse/demos/gic-demo.bin
+jailhouse cell start inmate-demo
+jailhouse cell stats inmate-demo
+jailhouse cell destroy inmate-demo
+jailhouse cell linux /etc/jailhouse/qemu-arm-linux-demo.cell \
+                     /boot/vmlinuz* \
+                     -d /etc/jailhouse/dts/inmate-qemu-arm.dtb \
+                     -i /usr/libexec/jailhouse/demos/rootfs.cpio \
+                     -c "console=ttyAMA0 ip=192.168.19.2"
+ssh 192.168.19.2
+jailhouse disable
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/001ddb8ce88f3c98003c408bad463edfd162792e.1618866389.git.jan.kiszka%40siemens.com.
