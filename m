Return-Path: <jailhouse-dev+bncBCPOXAO4SYIBBWUTTPZAKGQEMO7NRYI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id 9364515E29C
	for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Feb 2020 17:24:58 +0100 (CET)
Received: by mail-wm1-x33c.google.com with SMTP id g26sf3745594wmk.6
        for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Feb 2020 08:24:58 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581697498; cv=pass;
        d=google.com; s=arc-20160816;
        b=nKaCMo+SPq9OSHTUI22PSSG3ABjbSdFtrNWrkvZlgfBjcby4Zdw1Gli6UIJCb1ibHe
         XATvrnFX7lbF7Mdvy2xyHTo71qT52hQCg6UZtc4Z4DtyVn9YvLl1zg4tskj+42OKpdqq
         KJnpzNcHlWIjIXHm+sK5LfYeLEsm8+msq5BlJW2Uhu4JpiDi/nIqdYf6Mh/x1Rc16EMh
         LhG7z/+itcJNo3SIgEYIDG8Ix9yzCVBnXN1FjdtaI2+dZK80xDG+8CQy/WxMagnm3hqM
         eHwfp5D/m2/8RkDxwbp9ql49GKkuEKMrBlkLTNu/VkYPVEUGuIDWpTu2wUBuKHrOhlN6
         RZxQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=u330Xhq61x40cE/0zp/+/fYmO6X6HLNljHfjN/7Jl8s=;
        b=xPEWmMYXVKSIS+POM0ldEZ3DoXIF//go1uu4uc/aTqMfgE7zju7DAaqMXZIvKF9vu0
         U+hTvTNi+U+isBgBB/vmjzkGoOP1eIzC/WwWXZJhzjd8LBAb2ulK2j7tymbVwvgDVbP3
         B9qSRgyHNUPPtOJ6lv76Skk2KK9/Hc1TquoL+b3+WnQ3kv1TayRomdwRjR7W8UXlPMIt
         ccFXF4QIY9UJ9e35QeNcddn1LilSNYm4hwXTatEEqjOtihzlmd0KhbQ5VxTk728rRIv5
         Vv+FHNBq0yKRg1zL2Slcg/Q7xORY8t/ZhRvJwB7OlRv6zzvZfZmWCeYLUXhZhBQ24iWW
         vfVg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=L7q3hdxr;
       spf=pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2a00:1450:4864:20::444 as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=u330Xhq61x40cE/0zp/+/fYmO6X6HLNljHfjN/7Jl8s=;
        b=tFGDRACioLiG8YomGWTbVAD9KN2ywTzxsapMhG/zGScXMMw7djRJZ0G7seWPa7PDBx
         n9tsedEoV9cG/e1m2zLihdz+pRytS1/ZSS5q+XZtnic98vRUqy9fFDGV3tvmynqVgGcJ
         uDEgX/mD0kDQM/d6xBIXQf7MWv/avzEw0BJgoVy3wSr2BA9VQ6pL2OyGHpSrLvKJqsa3
         T5XNg7bZV+GwQy3fkYwXQqDgc4/4QBdMLGRnwY6/mAOrFYrvhdUkcT8uRAWOkAUhTTaO
         fWOzgWU9SGLBCcphE3l5P/dx3uvPc70SqegK7GyhzWpwYSqyFoIwgi/B9k57iJGynhaE
         JZLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=u330Xhq61x40cE/0zp/+/fYmO6X6HLNljHfjN/7Jl8s=;
        b=bJYt/7S9rYqpzzKGFZjUJ8zNlHcfUCtHM8Z2D0Aw2RnYxwFea6JuH4PENKvFGGM7Nl
         c8I7LMOZOTtRxhmDGm/no8e1A7IoZmwQq+4Rff0FKoWpTFHIMo0ke3hLdYPyo5Mfql/q
         zeXYaMZ8HRGJaauouL+X5Tjc/phbuj+U+Qo0wQ4PsdWnhoHo4QQ+mMqOYLnbM7Dai727
         YLLCfSgcUWEj+RRYeis3F4G8ihNkaZAlLQp5+AU9VrLu/LasmiRAWE6kphAK+M493LYF
         9d0UygZe/oACwCkl6rRcG48+GunZKyctbIK5n9kxHgV9LHKTwI8FH95oh8AVhFdzDWjM
         gEBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:cc:subject:date
         :message-id:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=u330Xhq61x40cE/0zp/+/fYmO6X6HLNljHfjN/7Jl8s=;
        b=P+j48GQmobrNST7ssaqY/VoJFekWHWuGKpPG749YNIWa4hPan6OAeKxrgLKZ8iR9MA
         Q1ntx+SkrlmERenB2EQQLP2dnIeqbZGixgsYPDfWYTpLJocVN/XzxvvljblQpm+BCNXv
         +VVoJ4Qpmug+St3Tj+JSOOUHVtz3oj00m28vQzI/ZxTVJ9iiQK7ytkW7BBg18Og1vNGL
         MxJQ2hggcukZTL9ScbqzoBF6jclsTgfsfv2vi7r9qQtIta5WaKUhjkd/Z6ei0m/xAR3m
         SQDgT6yNtgX4ZEVifb/530RnZ5fgWzL3hyYq8BAYl99zvdl+vSwB6Tf4IENbGw2v8uei
         uc8g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX7qbRi530ptHajRKYRFFltaI1+KsyF1EROvSQafgl1L/+WZkM4
	SHo8PzPmbUY4gsPbqNv4eCk=
X-Google-Smtp-Source: APXvYqw8Casx9k4YNBad/eLU28SN2rnuxO7gX7/lFnY926v1jIbcgPm36EYwE02rxVk67NHRtRRQ6g==
X-Received: by 2002:a1c:7ec5:: with SMTP id z188mr5403103wmc.52.1581697498255;
        Fri, 14 Feb 2020 08:24:58 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:ea84:: with SMTP id s4ls1450119wrm.11.gmail; Fri, 14 Feb
 2020 08:24:57 -0800 (PST)
X-Received: by 2002:a05:6000:1252:: with SMTP id j18mr5106388wrx.103.1581697497530;
        Fri, 14 Feb 2020 08:24:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581697497; cv=none;
        d=google.com; s=arc-20160816;
        b=uSAI9Alt+tejls/J7iGIuur8YS2F8meOuVHgTYBL7MKad1QKAmQxL5/RP0y1a4cWu4
         dG9BRUOP5R7fjL9clkAYsxbfj0zaPq8+cjE7utGpR8dZXDq9pJ8plEF00Irg31XLJIVY
         1KYFZavvUiEXxub5FgQW+wRYqaxUNU/ZKlD9danI/wD3A/538x4yxU4qxHOo0wgCVNG+
         zPcw9ofsP0XrOy/4fB5mcfqAVKVSyKyqrJp/9fe3ymbHYEKiwjxLJMDoLaVkVZCH2cxh
         nspEl3CxXnSGbGJGtihSAq4NCnSoAmWP1MDEEUN+4wcZumShv/RZqu1zkqFyWBTEGVzV
         m3Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=KvuUqYpwsnmDEEnpRDXA55iArnjBSZPtW8N/3TKsA9I=;
        b=KF77HXYvVR95qLYLUS+Gq4ZP9blc/8Cxb6DUw8JFUwnjGk8Co8aNCwP7aaC4iUHagb
         rQcN+Pyzo++3jAhCLwpWvck3El2SDsoaoJ1AxOh0RJMwCJ/bGBiegZfjeFnnqS8aV+ML
         X4dFjv0sQvz6YFpidRUyF0rrmQH76W1v1AliX4Ow/1UR0QddOIV80v+CJVn4g4ML/59Y
         YO0Ktgmq00ZTJuLWVUN9S2SQ8zmgbDdFxgx0tj80PSejpxwZfoh9L9HCL2WGVmPMGshs
         bVa0uKI4FIbgEwH5mFTbfsF7IUhC7oVLc2q3p/cJtpsDL4hZUK6DOZiWoav9eWh3OJkW
         LhKw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=L7q3hdxr;
       spf=pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2a00:1450:4864:20::444 as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com. [2a00:1450:4864:20::444])
        by gmr-mx.google.com with ESMTPS id u9si289287wri.3.2020.02.14.08.24.57
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Feb 2020 08:24:57 -0800 (PST)
Received-SPF: pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2a00:1450:4864:20::444 as permitted sender) client-ip=2a00:1450:4864:20::444;
Received: by mail-wr1-x444.google.com with SMTP id k11so11553379wrd.9
        for <jailhouse-dev@googlegroups.com>; Fri, 14 Feb 2020 08:24:57 -0800 (PST)
X-Received: by 2002:adf:b605:: with SMTP id f5mr4574616wre.383.1581697496550;
        Fri, 14 Feb 2020 08:24:56 -0800 (PST)
Received: from oxygen.mgc.mentorg.com (nat-sch.mentorg.com. [139.181.36.34])
        by smtp.gmail.com with ESMTPSA id s22sm7721336wmh.4.2020.02.14.08.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2020 08:24:54 -0800 (PST)
From: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
To: jailhouse-dev@googlegroups.com
Cc: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
Subject: [PATCH v2 3/4] customizations: Add customization files for pine64plus
Date: Fri, 14 Feb 2020 21:54:39 +0530
Message-Id: <20200214162440.27509-3-vijaikumar.kanagarajan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200214162440.27509-1-vijaikumar.kanagarajan@gmail.com>
References: <276d18e9-3f9b-4b93-8f5b-7223a4bea0f5@googlegroups.com>
 <20200214162440.27509-1-vijaikumar.kanagarajan@gmail.com>
X-Original-Sender: vijaikumar.kanagarajan@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=L7q3hdxr;       spf=pass
 (google.com: domain of vijaikumar.kanagarajan@gmail.com designates
 2a00:1450:4864:20::444 as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200214162440.27509-3-vijaikumar.kanagarajan%40gmail.com.
