Return-Path: <jailhouse-dev+bncBCPOXAO4SYIBBUFFSXZAKGQE2PMCPEQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x537.google.com (mail-ed1-x537.google.com [IPv6:2a00:1450:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id C536515BFA3
	for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Feb 2020 14:44:48 +0100 (CET)
Received: by mail-ed1-x537.google.com with SMTP id v11sf4897326edw.11
        for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Feb 2020 05:44:48 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581601488; cv=pass;
        d=google.com; s=arc-20160816;
        b=AMc8Y7WcoDFcSJNl2raJncnhgILDALP/DKsRLey55j0pfoiKrJbNpOA2KdzQzwV/3N
         To5tqI2G2YP7IEv4+H2CPZ5HslIwX4TCB0ds19zI/VAhzX6zJ3Eg9q0jVzurFzbEKJG5
         D/9Peyx83oQWVzEpqX2Kefqmp8hf7vSAVl5P+OiG55gDgaPleog3n/+feWeNjMnBS0b9
         eFZoAwZ1M4m9TfEE6fjTwbVUomt73yfx1gW7CfHW/Bqmxh1G+u96O1p6HayDnw3gWEUM
         0XUV5d326EyN9ezF9Q25lc24YTxCFID9mOgQK6d0HEuurPwRRfnYvCDxX82tKz/uDVpZ
         rEXQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=6Gl7k2/zlGg2navmaw+7cWlBlruksjUov3asw4SdOso=;
        b=uKFWSkiFRxyxeaUwuwP2912c7exKOUKQxtXwsEdFxVtd+ccvX94FHtzng/3kFMMli6
         El+nXidnyigkR+/RmQXSsAAlZogrksUnED9SE+T6AJ25wOETNTsHhuQsDw3Df7a7arPW
         6+MUpxLLe5+nlkrn1uU5RrRIGOBZszi7EGX/GGsOvb3Xg9OlmmfmVaVpyzS+lruXTqDK
         ZLKjqtYW/P0Lj/Qt0QRC/2w3035xNjHwYYbs07AM5XHE3MCqsIz1uoSDO0NZAkjkfhui
         AX/OoQwLhBPbF6VHLbHarT0QApcvZV16Pyjl7b7zXscpylB0XEz3FHqC6ptkvhuffrQh
         UHKA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=DjLNnD5k;
       spf=pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2a00:1450:4864:20::344 as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=6Gl7k2/zlGg2navmaw+7cWlBlruksjUov3asw4SdOso=;
        b=QRUVdilK3l8BMPwl0WmTAQYn7/Sqr5n/Wp1U/N2lWRfPvNfWRB8GZbEtbo5+s4aAlz
         S21U4xkBkErSv40OaBlBQQQeYWVjfGykMvcmmqVxBN+xTC22zyCOLnRwuhpofaurnuW1
         2ReOaXCrn1kkchRKDcLxorrvJI/shydjmUTHmMzo1/nLrZ+teWjGfhyPs22YxqnK+UI4
         oda2VwS1g0rdQTGOyzGeQuK4f+hoM5EEL8cYmO5DDkxM7Nz4/N8HwG73oB6O368oGlhW
         58BJjBBc31EahKAUjMFJaDkPddlw3rOIJpFdMFA//EzU/+A3ku8xIkpOnEqIjWMW/VAW
         qDxA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=6Gl7k2/zlGg2navmaw+7cWlBlruksjUov3asw4SdOso=;
        b=NYQjKWjtYiqQXAUuwuIgRJs279nTr88c/gRNMppkTp0L+qrdMf38EjcpoEnNGloKP7
         4wdUdpO2NmZbQdNRJuvUPXGfLbY8G/obxBiole0brm+a3Afh4snKnEgE9nMMLSNOJJcR
         7seWX7yQJHgx+9w1ILRBD6FSYx+5fIgJiYtTsfvGxvZr/zd4lxJw/i8TVEEKFKBvKJuB
         npMGDQI2v32BvOL5gJIeNNtYicyCDoHGS01Yx0oBa28DsBArzFbQYkrXjxC0LgIMlFMk
         cIhR21ISlIzDhQUfSSszXV5XSoT05dH/mbh30i6WaL/oWvBvzmkBIzLbG5vvCYHdDtyo
         pYqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:cc:subject:date
         :message-id:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=6Gl7k2/zlGg2navmaw+7cWlBlruksjUov3asw4SdOso=;
        b=tvfdStKAh1jPWLctfmwbr/xqWAxmaCdnYxjHcO/JlM2iyUWtYEI/3AQjvKx94NsdNJ
         BA8CCN0vF4WcrkszNRrJigoSLhcRUVysGzTDyOQTJthpGM+gQuefchM5NLg5ZyR/oB2D
         eUBFfuxeUssGMNivWAfgaijKkKiQJthw6Y9ICMIkHqPNHDmjynCWUv/1iibwrghq9ODS
         x0liaFVN8auBwkQ89N3ZlaTn/q9ZZUtD+Kffi0Bcg/OWOe5bI3lwhyUDJqVxVIbovat7
         ss4RPnFhIOOnBH5MdT5IrUMc9syBLjrXlM7GhVDIDAwFV3uSx4GeZNekYQ0xwo6chzZf
         iDUg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW72dvO/uVx1TcO1B1iUrmMttc22gYW+Azn4gaelDDRqLA0AmJs
	897/Z7zgmc6fBBdvcKiX9fM=
X-Google-Smtp-Source: APXvYqw0Yl19Rcl7Sigjl0FSwVw+l9v5BG2odU4s/UpSKSRg9eTLQO4u7G/orGXuf37Io3WDB0iRJw==
X-Received: by 2002:aa7:d84b:: with SMTP id f11mr14821767eds.96.1581601488532;
        Thu, 13 Feb 2020 05:44:48 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:e20e:: with SMTP id gf14ls12022688ejb.10.gmail; Thu,
 13 Feb 2020 05:44:47 -0800 (PST)
X-Received: by 2002:a17:906:8388:: with SMTP id p8mr16477372ejx.358.1581601487844;
        Thu, 13 Feb 2020 05:44:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581601487; cv=none;
        d=google.com; s=arc-20160816;
        b=UewvukEzdwhD8zpkfTYGfk0sQbuzqcDsN3orAWSsMWtbs/Vh8KWWUJ98GzGcFEuqL9
         d2F/ka7XABSvyPg2kyFc/sEbUzuYQ3IDBVQ8ckDYxesEjXiAZ/2cP2TtwoEBhaGT/M1u
         /JZbIt6GME90ZMtnwM+NVvKiqpmbGB2logdgdxa7eTkAo5znd49etbjjFWg+RUDm46Gl
         UAlbSbz6JPDjXva1j5i1LqyzIyEk8D7CmLYuw94RLlnK40qPMTYOTzWvXW9jc2AnPQd5
         EeydsZY+aqK6pcll935K0PSodnXhMQwk0EPO3j1PzrTzVjc3xiiy279bNJkUWpqmffAK
         ygTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=KvuUqYpwsnmDEEnpRDXA55iArnjBSZPtW8N/3TKsA9I=;
        b=LSYtYjsv+Nx9fJbFGwJCau6s3fkFe7PZpasucbm2hf6FEvcSxXnPSqqcBdyCBqtbFu
         PqYTf2FyKjXFPMha5Ktm5KiS5sBb1CVIzsrB+5odOt+1o7s1qJF1OYzq4WzR0LBEL+gI
         IaTAqrOQy7aXbXnuH4VKbnHbcIKzgJCL6PELVySOMEXwhnPDbDyc99M4KjK4Y454heMo
         diKodhyX3LRrzH9r0FpERCvz1MHjmo1dVDmFVf1RKBhMenaZMpJfjEqN9+wv+yrYMaqb
         BhdvJ5+mHqFihATUMrvpABLShjZ/opwHKl2mC7K4LWl4ZUhQuVzv88+EAgvchytjOvjG
         xT9g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=DjLNnD5k;
       spf=pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2a00:1450:4864:20::344 as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com. [2a00:1450:4864:20::344])
        by gmr-mx.google.com with ESMTPS id n1si158683edw.4.2020.02.13.05.44.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2020 05:44:47 -0800 (PST)
Received-SPF: pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2a00:1450:4864:20::344 as permitted sender) client-ip=2a00:1450:4864:20::344;
Received: by mail-wm1-x344.google.com with SMTP id c84so6808011wme.4
        for <jailhouse-dev@googlegroups.com>; Thu, 13 Feb 2020 05:44:47 -0800 (PST)
X-Received: by 2002:a1c:8086:: with SMTP id b128mr5631147wmd.80.1581601486196;
        Thu, 13 Feb 2020 05:44:46 -0800 (PST)
Received: from oxygen.mgc.mentorg.com (nat-sch.mentorg.com. [139.181.36.34])
        by smtp.gmail.com with ESMTPSA id z133sm3162729wmb.7.2020.02.13.05.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2020 05:44:45 -0800 (PST)
From: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
To: jailhouse-dev@googlegroups.com
Cc: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
Subject: [PATCH 3/4] customizations: Add customization files for pine64plus
Date: Thu, 13 Feb 2020 19:14:29 +0530
Message-Id: <20200213134430.3052-3-vijaikumar.kanagarajan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200213134430.3052-1-vijaikumar.kanagarajan@gmail.com>
References: <20200213134430.3052-1-vijaikumar.kanagarajan@gmail.com>
X-Original-Sender: vijaikumar.kanagarajan@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=DjLNnD5k;       spf=pass
 (google.com: domain of vijaikumar.kanagarajan@gmail.com designates
 2a00:1450:4864:20::344 as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

Add bash history and dummy postinst script for pine64-plus.

Signed-off-by: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
---
 .../customizations/files/.bash_history-pine64-plus | 14 ++++++++++++++
 .../customizations/files/postinst-pine64-plus      |  1 +
 2 files changed, 15 insertions(+)
 create mode 100644 recipes-core/customizations/files/.bash_history-pine64-plus
 create mode 100644 recipes-core/customizations/files/postinst-pine64-plus

diff --git a/recipes-core/customizations/files/.bash_history-pine64-plus b/recipes-core/customizations/files/.bash_history-pine64-plus
new file mode 100644
index 0000000..8e8b246
--- /dev/null
+++ b/recipes-core/customizations/files/.bash_history-pine64-plus
@@ -0,0 +1,14 @@
+jailhouse enable /etc/jailhouse/pine64-plus.cell
+jailhouse console
+jailhouse cell create /etc/jailhouse/pine64-plus-inmate-demo.cell
+jailhouse cell load inmate-demo \
+                    /usr/libexec/jailhouse/demos/gic-demo.bin
+jailhouse cell start inmate-demo
+jailhouse cell stats inmate-demo
+jailhouse cell destroy inmate-demo
+jailhouse cell linux /etc/jailhouse/pine64-plus-linux-demo.cell /boot/vmlinuz* \
+                     -d /etc/jailhouse/dts/inmate-pine64-plus.dtb \
+                     -i /usr/libexec/jailhouse/demos/rootfs.cpio \
+                     -c "console=ttyS0,115200 ip=192.168.19.2"
+ssh 192.168.19.2
+jailhouse disable
diff --git a/recipes-core/customizations/files/postinst-pine64-plus b/recipes-core/customizations/files/postinst-pine64-plus
new file mode 100644
index 0000000..2dde661
--- /dev/null
+++ b/recipes-core/customizations/files/postinst-pine64-plus
@@ -0,0 +1 @@
+# Nothing to do
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200213134430.3052-3-vijaikumar.kanagarajan%40gmail.com.
