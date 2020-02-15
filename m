Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBO6LT7ZAKGQELQHMCMY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53d.google.com (mail-ed1-x53d.google.com [IPv6:2a00:1450:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id 454A915FE75
	for <lists+jailhouse-dev@lfdr.de>; Sat, 15 Feb 2020 13:36:12 +0100 (CET)
Received: by mail-ed1-x53d.google.com with SMTP id m21sf9637369edp.14
        for <lists+jailhouse-dev@lfdr.de>; Sat, 15 Feb 2020 04:36:12 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581770172; cv=pass;
        d=google.com; s=arc-20160816;
        b=hS05N4o8ZXSP6p/itASnTyWSo138M3fx0HtbEjb0TXGzc5a7MoTmIfwycpKwmETthy
         +a6Z11AKQBN48nQ1UXK4oHNh7aJsS+SO2NeLQOKd45NE48nbC1vvFp+zJGw5+9QYZCLP
         N0vwPCRO2v1uY7AAXkaPzkmOyyMnW7pxOjucPpgvJOVp0LkEuCpSnnWltvSHLVc8fZ2n
         L9RbSm+3MyIQz/wv6aKvrLHSHuRn/eVDQnatCQhLiGEtu5T5zSH+YzQLN1vp5QW47LQe
         H07AsFPPEzPTPbA35pTKLHEgaogbYfoN7qhGvevMCSz1G7w54JOhnQKDIaRQP5MCxCxR
         4VJg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=ZOWhoe6+FyvX+Fot6Vz9bKguSZKsu/Yazd+9DBqna/g=;
        b=ZUH2quAJZyCZThSb4/bvGdZqh5BGNj5m387lKNXZY1ghN7waVkstjpUGFh28eC4PPb
         hlWPef8WZ5mr6jjd3RUDDWldedM7u+/pTDEP8rd1tnGcvvfkdQpHLzAfXJmTqCIoB95o
         PxUS/257caVswZNqbV6BOt4gDuSBKoZu5Auig+KDcuS+QZbtgaSCgbcgLW/acvW0YbsO
         Gdqqz0Tg4Y5rDDS1qpRMy1H/i12W0rpbpkFmbJ6Grt24R+a7b/Fd7QQToTOfW0ZwzEzQ
         1xx902TS7JeQxOfFirKW5sXUtgkvdXefA/0ONXFOklvIAZZe/0CX+rT3XUQA/KvdH2Vh
         HtIA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=HNdUlfzr;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ZOWhoe6+FyvX+Fot6Vz9bKguSZKsu/Yazd+9DBqna/g=;
        b=slVC+NX7fOJj8pLcPTnYte2tfxlzD4qcp+7MpHyL6XwGxKARYUcqCHXGOizwMRo9te
         TCDXzj6JLXE54cXAB7qj05TNxDYnrSI1ENKADTi3R+6/ITqdGeTk7eRI1dqD8HnB2eVA
         peU31KXVhKmFGE897gAkQ6xea1FuQF8Kw4jRvT6GvE+vB5Pm2dGS/UY5j5Dv5s1DbdLC
         8q6nQMdNwve6uaw7xTOVl36sCPsliYRCo55old1Br9JZ3TYm9gXa2ry93nKYnI00oqD5
         76U6hdywLWSfLo+ADk8Yr5xJeOn0xb2CLCJl55D0ls4qChGKd7N72iYilaa3915NX+ei
         5Fug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ZOWhoe6+FyvX+Fot6Vz9bKguSZKsu/Yazd+9DBqna/g=;
        b=tD8GTVABvjCfsO/yLjaL3LS61UDICDvAFIJRiC4sYj8iEhj4glqK4mZW3Fb0SKTPqi
         jVlrpoJ/ABRqAnR3g1sEiC8Q+PB8z9O09ZYS7J/MpVXWJskIagwJZY9juzNcFGuRl6kl
         R35Vi9N7wV03UPgqtKf+slbj5O7KwsNSiH+H3XIFpI9oP1pQ49mapuXS0eXK9/sB5av+
         mNFAOlA9d/MlvO96AL0lZUBrg7UF7afCW3QeCnsqj6MGmvoUF7a3Q6hYtXCitcwk6xQH
         wNy4xua265lEpcxh5avtUUVp5A+QY1pBsf06W5tZyNaifQmxRbZqKlXNjfLc8TLFR1Xf
         sM+A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXt1Tr3V5XNB2fYUrGVMadm1EsR9Zsr99/mgHkJh1zFI8cWAzPF
	Bvd6Ll53JPooLkM8hTsulpE=
X-Google-Smtp-Source: APXvYqzzT28XoP8dv4QEOz58YDrq85nvQ0c3RrbiCt5TXpZacce0VykBUgtvCHow307LS/AgXanqzw==
X-Received: by 2002:aa7:c707:: with SMTP id i7mr6641634edq.287.1581770172030;
        Sat, 15 Feb 2020 04:36:12 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:584f:: with SMTP id h15ls1787078ejs.9.gmail; Sat, 15
 Feb 2020 04:36:11 -0800 (PST)
X-Received: by 2002:a17:906:454d:: with SMTP id s13mr7537495ejq.18.1581770171506;
        Sat, 15 Feb 2020 04:36:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581770171; cv=none;
        d=google.com; s=arc-20160816;
        b=N/jm2zcFd1pAeCtK2pVLiNfaSGV2po03gON3fJISC/nZfUiFQJWSMDncRyuk9oD6bs
         lS9PYE8s8YJxjAur/IP8expm7iI3kH8htUQYu0svwR2mfCD6fusajHiuND+Oik0gVhuF
         37huD4noHb+5DY2XodckU3ASj2HJScE4nCxdgse6L38CHJwboKHLHMHJWpGiwHX+bBBo
         RvbetdIPRg3XyOz7O5gVU0rIPcZz5pzt95qg5qX+oFQsJ1WXS5eGyGzXkyCV0hDJHH3F
         Vb5Fyc7Qy00pL1eJs1blIRaO80zqna4tfnoEL8fj0X6YMOB81wEaylzNPVY0WgJDe+Gv
         kDhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=749KZ1P+8UcUz30AEz4v7zFzpcFYMTlrHf3PZx/Gej0=;
        b=V3JvFFcpxZYvd6M4DQSy9uwDpzyiNdf4zD1ykCQNe8NZO0ZtKl1yM/JGXxEMvqPNZ0
         KABQYWe1PJ4mX8WnE6fFEyIm8RKHlKIp+k6n60ii8lmMMw/GqGkoORqEnzJFN1zGp79L
         d9wrnI7M+3UAjMG5OliHKMU7YWoU9M1dZuJFdKTw+/GlJwL3enUdNzqj9wa5B1i3nUY/
         wiEX03BF88TD6E1gCW0aKGl8ePpKgUmfQok+d4l8gAGFt+QSUOVgFu/+smagNSZlQQ9M
         XvYqxvSADoWP3uZo+8a8dbkXHr8cCR10695JpKfEDo36nXWRLPUEy7LBDnM/OEnMOVLw
         BmOw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=HNdUlfzr;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.4])
        by gmr-mx.google.com with ESMTPS id z20si409680ejx.1.2020.02.15.04.36.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 15 Feb 2020 04:36:11 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) client-ip=212.227.15.4;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([95.157.55.156]) by smtp.web.de
 (mrweb002 [213.165.67.108]) with ESMTPSA (Nemesis) id
 0MAdX1-1jD5we014l-00Bw1T for <jailhouse-dev@googlegroups.com>; Sat, 15 Feb
 2020 13:36:11 +0100
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 11/12] core: Reorder CR and LF on debug console
Date: Sat, 15 Feb 2020 13:36:03 +0100
Message-Id: <25787d78f88b97819c8769e296d4e1edeca68647.1581770164.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1581770164.git.jan.kiszka@web.de>
References: <cover.1581770164.git.jan.kiszka@web.de>
In-Reply-To: <cover.1581770164.git.jan.kiszka@web.de>
References: <cover.1581770164.git.jan.kiszka@web.de>
X-Provags-ID: V03:K1:dzf19yfU7NwvL7MF5KY66eZEdI8DG5ELa8jlY63G4yLjiXXwF1y
 UwU0ia/Hqy6LfGkxUyFsm76Rf3xObBezbqOFMP8H4cC4f9AKENUDVOP2BWEeKhx2GG4YI6V
 zvkxN5mgSoRLt+N7u3QuUlB32vLHv3HqJTXOUDfY58BkKDIV1EhElL6k03eIi8cVGly4pv6
 gh2rQwSMxKQ7VDiqwreiA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:AYlK7p2e99E=:hQ+I9JgFG4E0+sCOzY4Tlb
 JsTSrW3w9VbPrrik6ghCdjE5a0T02B3mmu4oEQOer9JncyY+YZm5tS3iCaWdbvPXqfzHIwCkI
 mBDUnZotsc/OKtGsCdKNQx34T+04pyVETIkjon9iV5dixwylbsKIWea6b+s9DH/g1LxRnq526
 mnKQM23pyzF2f6HTLKaBvH0Dp8W2Wam7mMPbwG4OBrQlqooid7yWDiOddMI80hY7hvAwOaPz6
 1jbnTlUAbPhjRbtbjN6byuQ2xgQb4Ktik+PdWT+WpYWWPk69Y7iaP1LKAt5RTSF6M3dbn72TY
 RUOQeAfxFbGP33BMZTpHruT+Yivg9I0DsluKNNm/T11xu27bAm7263MkhLgO51ejKo7WaUMGE
 7B9UVxN9DOjnm0l9RlnjRntZ+HwR+ExdDN4IkBIhFKDAzOuw+resJpkuf+kDqYbcu0d8DauWn
 fDs81wDOOr0CG9Qyyn2sz7u1SLmFSlwv9l/aUAVncjPW6wENNYSuIPWF9357iZyi84qs2KoMN
 art7TBKZgR/8GXe0fz6CQT24itxzmVvc4kBqVIJgIWrBPsKsJC+sAhyXxpt/tT7HkoFwIB6Ac
 1hfdjfdt9MgKEmA2BU3Nn50LtYVqJlHDsniQmP+w/48RAhatiRwkKd/+8DuCBA3mdtryafuB6
 oyhYn4dRySlNRR8LmUHrlkrCFAPa69ADM8wWEwzsspsNMOLUdcLPhnvtFzlXW6OwZQk8BT4we
 8ahQzZl5NXs1pFEtghG3PlSfcF+r8UeYTsFFJHdtJJ5z7Yu3K8o3M6akq2K0o85/0l0psaXUR
 xstkh2s2OoVTq0ODGrAs9s40GTZZYLS0u+uWD97GWjpmWOM06bb44nzbcVWXzNqPT0+jNDFds
 67dAKLvC5nRjnfIG/403jKe6mQk0NGhBnYet/wtkyw00g9RwWf7ilvZ4gq4NnKf1kANEBy+9V
 sMaoC1Gf7VLzH3KtWc+X+Gg4l0XdxAU53o0zm3GDNA6xWmL/NLtce54fV+zOoFqh9b2MuCo86
 YMOEcQ7/7szo/QIU+ewsbM4YLInHC6KiIgMl1h2GVQC9hYqAA+xQPzzO2ExY5tbOop2adBQMB
 Qk3toH3iOGO5Qc12Enp5WRTqVFq3NnOkySe7w2H4HHzc+fg9yiQLc2N8zPzqziDDf4PDVIRpE
 SNWptAvRhckHnClt2jtbZNX+iyT7pZf2q9v2JKxq2o2KQUUbcAHNv9lM3t3wJt0bMe8ceMaZC
 M8NupCwqXFqXSHxhQ
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=HNdUlfzr;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted
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

Unix tools like awk expect Unix ordering and that is different from what
we generate so far. Issue the CR first, and then the LF.

Reported-by: Michael Hinton <michael.g.hinton@gmail.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/uart.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/hypervisor/uart.c b/hypervisor/uart.c
index a43773c2..6980970f 100644
--- a/hypervisor/uart.c
+++ b/hypervisor/uart.c
@@ -2,9 +2,11 @@
  * Jailhouse, a Linux-based partitioning hypervisor
  *
  * Copyright (c) OTH Regensburg, 2016
+ * Copyright (c) Siemens AG, 2020
  *
  * Authors:
  *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
+ *  Jan Kiszka <jan.kiszka@siemens.com>
  *
  * This work is licensed under the terms of the GNU GPL, version 2.  See
  * the COPYING file in the top-level directory.
@@ -17,22 +19,27 @@

 struct uart_chip *uart = NULL;

+static void uart_write_char(char c)
+{
+	while (uart->is_busy(uart))
+		cpu_relax();
+	if (panic_in_progress && panic_cpu != phys_processor_id())
+		return;
+	uart->write_char(uart, c);
+}
+
 void uart_write(const char *msg)
 {
-	char c = 0;
+	char c;

 	while (1) {
-		if (c == '\n')
-			c = '\r';
-		else
-			c = *msg++;
+		c = *msg++;
 		if (!c)
 			break;

-		while (uart->is_busy(uart))
-			cpu_relax();
-		if (panic_in_progress && panic_cpu != phys_processor_id())
-			break;
-		uart->write_char(uart, c);
+		if (c == '\n')
+			uart_write_char('\r');
+
+		uart_write_char(c);
 	}
 }
--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/25787d78f88b97819c8769e296d4e1edeca68647.1581770164.git.jan.kiszka%40web.de.
