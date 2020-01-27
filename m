Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBLUKXLYQKGQEJJDZBMA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B536149F08
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 07:37:35 +0100 (CET)
Received: by mail-lj1-x239.google.com with SMTP id s9sf2203354ljo.11
        for <lists+jailhouse-dev@lfdr.de>; Sun, 26 Jan 2020 22:37:35 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580107055; cv=pass;
        d=google.com; s=arc-20160816;
        b=u1lj/WPVzUzARz4ccHyc1EQMomHu9sBVy0Iso+TIDhlzNyPd6/0Z57EoPexYI2RU/F
         ffRn49vuH0RWUMugsv0Q8jdXEvQmmJnlKCckxQQiaYT+wIwTTQG3GWSKKrGsQRjGN/Kb
         bpZxPNk7gbG1DjDhru7PVYiEzQC4s5m0YH1wc9/5v+6kIu3DFcuMC4juBle7t6jd22ho
         h014+Vi1e1kEKyfoWX2Bd74eN4mmR2G2IQpBCL5GkEwwK7SCLoM5U7aL9G/91OmHs/im
         gyKlSY5PQc4Ll8zEntdJbF7OzKJviLgEptWYbaAUP0fYLMvJcKme9KTdkoiuSwTXGNsw
         MuYw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:mime-version:sender
         :dkim-signature;
        bh=WwaDXr+AzBwL1Y9aqCsk7xm0mC24Fqk3JINOtnildkg=;
        b=ANn/RwWUzw+zXZPY3RSQs9AkFfg7n/JHbkI6NhW4XOstdyxo6S/vW/WBPHetEJQ/YD
         v3NAgSQTSyeyXiAhNwWSU7gVdbybNp6ZesbAq7bu9+f/c8pD0FK5SXNJtkbHwxUzOTQz
         9RjaJUqthdokwXTDwBsg22uDgPYU0vKXp/wh9VU7M8n1SbbcxLAbBCZ5WP2clJ+QBegu
         XRzZFepVSXDGQoLFR/J3r7IHi6GIwsB93+u/ODRzmfjlomShNnwOqXAV/qxXBK/qVX0j
         5iu+DMur2NmsjT/BDSA02JQEQZtKWolMn4JfReT+QgkpKRIzeP0PzV9SkdNCIJpI2GpL
         xIhQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="a+oV+f/7";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=WwaDXr+AzBwL1Y9aqCsk7xm0mC24Fqk3JINOtnildkg=;
        b=mhT+Swx5IUzE3IjbrmwNORn8sdvpeSOCk06tTgMEKXFHNPH2dZs6ldbZoZt+JiZB/I
         dSo7lqeXquULOoDB8BLYh5GsfxrODQsj0vEb8HX7jAPdDJOdGIaEYK2UcAsaEQoYJTtt
         fiFDiAvPZ2sipmkwncgvXjxNrPd9IGc87LBoESJ7KkquBdnbZwqBjZZLRZ4wNlXH9SyR
         PH1wURIKSDwAO3au7/sCJgzA4VZpiSvyhr3meQ5IoxlpL3L770naw1eK0UYeuedJj+8a
         ckLSugEVSpVMshkLYV3NDYOu0+zrOhG/8rIclu8moRxahdlM4aG2UVpRpjmFbZhYKHxe
         BjPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:cc:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=WwaDXr+AzBwL1Y9aqCsk7xm0mC24Fqk3JINOtnildkg=;
        b=lXjtNJwaXIZwXVt1ocPKnCDOpByGvyCAqN7EvBcRLb+xPM5AZZnSFo4kse5xG9xBu0
         p+/V6YpMEAdf8JhQ9KIscTGQZ+L/37hTZ0KgKFObUZ47FRu8uoHsPKoZO6YhvuyjjWpT
         zMLfxpwr7QAue3yCUbCFy7qpNPKXQ6TjahGDnTzCfn0Rhv4XJOjIPwWCB6f6R5/tiaYP
         YM8by2jEUMNP3OHOtwYLtwAQfDIXncrwEGJUwEdcMv5tHuD5hOLLk0/r2HbZfr4urVxy
         RkAlh9oboTbnxlUfy3LrZvEmOfj0Jt/YRCbyhDAag107+2YLZLjJVuqsYMj6JCNB5Z+Q
         cqEw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU8lBpM4UtWESxv0CuxRgrNueZ8+K9CWfEy3KG4asHg+mNe6Yhq
	V6bi/kjXtTj52/zbpoPCN30=
X-Google-Smtp-Source: APXvYqz7ifuVLsiQSnnALj2lOwBh5DlHiQe40oQGwkRlZW8hXGucgbRLJL1pRn1qbr8rcf7Yfbyf9w==
X-Received: by 2002:a19:cc07:: with SMTP id c7mr7314697lfg.177.1580107054978;
        Sun, 26 Jan 2020 22:37:34 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:3f0b:: with SMTP id m11ls939962lfa.0.gmail; Sun, 26 Jan
 2020 22:37:34 -0800 (PST)
X-Received: by 2002:ac2:51de:: with SMTP id u30mr6998602lfm.69.1580107054287;
        Sun, 26 Jan 2020 22:37:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580107054; cv=none;
        d=google.com; s=arc-20160816;
        b=Vy0LLdhgfkSZ2S8FzkEWRndNseF9BofYaslEB3RmCwmocdLhZHgRoGIfmSFgwa9VQ3
         FPbHAwqav6l5e9KcwQU9YzquaKqWnuiaNpSOdh8LLIJBoosKWNzOQ6G+L80PzypSw1OF
         uFshYPcC2Mg0neh48UMmlJWVBz6ssqfc/c9uV/1M9S2fNKt4La8BXxlyHGjuEHDrw0Vw
         gE9WmJD0sTIUF7nXpygO9MqGgzyVpbRl0FE08gz7F7SrtLr3Q5NpYILdTxH5tVmOinge
         TbfToqzO/5heD8zUG34soKw+og1NADtsT8VywEJW1BV6ZVfC5IYppawDZxtAY5UmOY4Z
         eoDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=9Eky0TzLwQpxJwI4gUzC4W4oSApZCGIlZM+E/Bpmha8=;
        b=ykToT3FEWJkMeAa6UcG7X0LtKHfXE1I3Bd/GXMRslk5uO849tgYOoP8BliCfcSaueO
         Xmfqvl1WEyPfyYJv9WU4K2CJMNIXkhG7W9mmrdMk9LEQKxDBBrH9uvWO9ctOBUeEeH5d
         kIp9jEJ7pnImnoB48/L9NLzgfOMWueHLd6SFxWRCUnDp4e4heNbhQuiiyMwFb4x5U8q4
         M8oNfMXPadjMIHy8guEM02l8ifhg38bSfrrzRIMyWZc1Ixb8Vq8aw8WaTxXfdTyackJx
         QHpylQu5+m9I43QZU1jehEHBM/QdPftLhf85D4BensOZYdeprf+N5DIIxNs5ljCcnRm9
         y+0w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="a+oV+f/7";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [217.72.192.78])
        by gmr-mx.google.com with ESMTPS id o193si497165lff.4.2020.01.26.22.37.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 Jan 2020 22:37:34 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) client-ip=217.72.192.78;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([95.157.55.156]) by smtp.web.de
 (mrweb102 [213.165.67.124]) with ESMTPSA (Nemesis) id
 0LuuS5-1jeCk81xfF-0103lS; Mon, 27 Jan 2020 07:37:33 +0100
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH 1/3] core: Tune comm region's flags field definition and documentation
Date: Mon, 27 Jan 2020 07:37:24 +0100
Message-Id: <c1d059a56b20261f75a268fe7bbf94f3e796d99c.1580107046.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1580107046.git.jan.kiszka@web.de>
References: <cover.1580107046.git.jan.kiszka@web.de>
In-Reply-To: <cover.1580107046.git.jan.kiszka@web.de>
References: <cover.1580107046.git.jan.kiszka@web.de>
X-Provags-ID: V03:K1:KkHq8JC5BLAPk1/uCOvWPtuKKmlGJHsKUgSdeVupvr6HwHjC00R
 N/CoKYy8DhcXQX0LhlwwECtjKNBQeCf1dZJquXP0riVzcLwsxSKWxn+n5AXqCoUATzsQTwK
 m0Jj7y6u6FcblDyiAIf1d0CVJASp35y3UaQh0yk8V7VkZ5T+Ft5YYH/ixwt2//AUlIqe0aG
 YJCbwNZE3TzatpblHDCSQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:0drMsqLg8V4=:bNWKqy4bX4hfsCWEC073YX
 oYDPcvTkjr7wXcBiOkUuUiqzIl86Y23gUuUxdVhuNL1Nc22CkH7DWTjqQPnCJeaQuDiFqxeRj
 egTy7vUmpBg4qjKyNrNyBYO/XX4iA4YY69oNs7faTUn3mza0lAN+dY6mOETCKtYRv2jEnlfa0
 X4x3ookSbWEcDpExSw9h61P1xqoqVAojmjYNBB4jb6i2RpoOw+lcDQjUjxW1SQuqWf2fye5hH
 MsyxPXlOheoOAUSSxPHCvwqT7P5z1847kFOGbznig7sG3w04hHBk+ERmIX51TWR+bY24Tu/Qj
 h02oW4zRIhvvCdhdAiCEwKqsnjGP1PBVVxNXVc0aIs5JPaThIkyHdu5iXxDLddbjrrgG9GVaR
 zzg72w0dW0vf0juHOKAeormBGVk8iV7RCXQWGNw9ZV/EL8LST2I2lURZr6CCbvOTY02+WoKqI
 cXmEgzqVg9BdYlythuAvRyqzDGytPMeF0/7WF69kiVAorUJ+SJoJgdiYJQdu//PRgtfrW5ntd
 ssA4Vv4UQ+uaCfjbCSiDHyQvuuauDRzwlGvMMktTZQMJw73R5/rUS5Z2LW/BniTIqADwvYlAg
 07G4IbSkW9JL8AQaYalFIEPwiqA99lXjGTT06PBwVrMbOpiPgxMPBt308Inp/dtd5Kwvd7tZm
 IhKYpeAV+LO4jFHTu2HqLQf8PJIJcktPb4JZWC5m4OND5MzBIQpph1+RyV6kLly/BcmrBnoGI
 c+CSCYFhzhOIMV7tGG06rzy3yCSl3XS9KQFElQ4ydcvQ1kOixpkwLWlKcu+VKsbzw6HeuFF2+
 BuUCvWD9PyORnTjBaA7p5gjEoNCGa7foU1kC+dj4ncshmXywnlBkMp170oTxmYSFIpo11jjcv
 tsuRZW6T0E8mXXEwanEsWFa4DyTqx1E2q64bu+cEDxjE+RE4zWAVQ84sPC9Zfik25ZlyRLzar
 QjUUI10a7B42A7yHebKapzPGMiHLvASg0lxKwK3Yv4n5bzRgqlOzLEnbCoiGdnR15ZY/zH5fm
 4KoCBP6Wu1/JPRxbw9k/mfC2IxysckxPg/wBDw1mjTAIPkVQ6B3QO/MlWXj6a79S69f68oaee
 mp2Gtu61Jiu5TmbjjM7JWlOQJbXNXJSLEOUWuBcFd8Uw28SaSXddSiLV0A63Nvy6Ne5t8d9zP
 ghHNMXSoy1vHpkTlfZO2OwHnI+t97DAgUaBBSDCGw5WOUcNPjfD2I9t6dO1Ej4tF+D8wNOHNa
 7TBqMu8GVdJWjs7AK
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b="a+oV+f/7";       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

This field is static, thus volatile is not appropriate. Rephrase the
field and flags documentation for a clearer wording.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 include/jailhouse/hypercall.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/jailhouse/hypercall.h b/include/jailhouse/hypercall.h
index 20eea801..07574d3d 100644
--- a/include/jailhouse/hypercall.h
+++ b/include/jailhouse/hypercall.h
@@ -92,9 +92,9 @@
 #define JAILHOUSE_CELL_FAILED			3 /* terminal state */
 #define JAILHOUSE_CELL_FAILED_COMM_REV		4 /* terminal state */

-/* indicates if the inmate may use the dbg putc hypercall */
+/* indicates if inmate may use the Debug Console putc hypercall */
 #define JAILHOUSE_COMM_FLAG_DBG_PUTC_PERMITTED	0x0001
-/* indicates if the dbg putc is automatically used as output channel */
+/* indicates if inmate shall use Debug Console putc as output channel */
 #define JAILHOUSE_COMM_FLAG_DBG_PUTC_ACTIVE	0x0002

 #define JAILHOUSE_COMM_HAS_DBG_PUTC_PERMITTED(flags) \
@@ -116,8 +116,8 @@
 	volatile __u32 msg_to_cell;					\
 	/** Reply code sent from cell to hypervisor. */			\
 	volatile __u32 reply_from_cell;					\
-	/** Holds information special flags */				\
-	volatile __u32 flags;						\
+	/** Holds static flags, see JAILHOUSE_COMM_FLAG_*. */		\
+	__u32 flags;							\
 	/** Debug console that may be accessed by the inmate. */	\
 	struct jailhouse_console console;				\
 	/** Base address of PCI memory mapped config. */		\
--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c1d059a56b20261f75a268fe7bbf94f3e796d99c.1580107046.git.jan.kiszka%40web.de.
