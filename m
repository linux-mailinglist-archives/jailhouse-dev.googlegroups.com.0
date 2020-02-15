Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBPGLT7ZAKGQEJGKCB4A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33d.google.com (mail-wm1-x33d.google.com [IPv6:2a00:1450:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id C57A315FE77
	for <lists+jailhouse-dev@lfdr.de>; Sat, 15 Feb 2020 13:36:12 +0100 (CET)
Received: by mail-wm1-x33d.google.com with SMTP id t17sf4704622wmi.7
        for <lists+jailhouse-dev@lfdr.de>; Sat, 15 Feb 2020 04:36:12 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581770172; cv=pass;
        d=google.com; s=arc-20160816;
        b=xl8545ERSX/DR1n9mnrl1yJEBJhZ1tp/LAXRi3hZUYZufXAK6tkdoNB1xTg0/sj4aq
         4qIWQaxfbsoKPMQCODaydjqCosiJjv/Toi7+0TEs9lDDmWoJ4mr2NsbFSybHagnZ+YTB
         KOhdLqxPQMfJBmYZ6n6EE3sBmpaXeGlRSnhjLAyC5bTJambcg6ViFB/+VX6S5LzZjLua
         15IvPzd1ygyJR8MIAdIl/OKYaQMstnTfvzZ8DCjC9FiYl0QnCZ/XCfevS6Zg2iPv3vfp
         3UzhLC0Wv4B8ZdVnCJiQvcAtKphbABpSLKXDe83oCnJFj65A3LwCUU6KxCYJl5FcJtFk
         5qhA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=6nI+kcxnSPSBF77h45iQiq8r3QwhEKbMHE4rEkzdKKs=;
        b=ANbn+cWzNbNiF2+QrjspIiQLT2fCc7ORx0lRmLbcCY3e2Xdg2/OdQmhlNYXqoSEegp
         UEjg9Y7YmazfgDvaakCapjMm/+/Gl4glsBRRuEMhx6lxqp4ks1/7nUos4eYa1k9N5JNV
         jmFTqYvd1HxFzvFhVlmWWqxF0vwBaWkIyJIjDC9pmOYAPfpqmD4ScycTo88BjXQFQBLi
         7F/QXNIq4Bqc8oWnZFQg5i6dfkg+h8RGUSvat+3V3osN0pQnNExI7FhI1nXXe0EpSxK5
         g/DZB8JvS26aufLXh2nVyqhTDIQGstezza6hJv7RShR8lK+YLVUDOGf4LLYC9HXlRvOX
         WVIg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=L+qIrUSP;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=6nI+kcxnSPSBF77h45iQiq8r3QwhEKbMHE4rEkzdKKs=;
        b=r8b80r7Rdh22QhpM1p7/Az+t0uy0mmKX9fByJSBT0OpJDbGvxPaWcCCBStzzbFX8LO
         QtBBTKjavagY0DdQ9sXYIKkzAaR0sxu6j7mPncyW4I7ATueV2gcbj4yrSWUDsz4eqiff
         r1KcVbA1TUePM8lLhjsJlnlD1DkWUPia/KOuwjg9cJOk7L7ZItDx3hipDfykvGf0Io8o
         xZ6K8AC89VgtSJUPKM/rYHzEkisV1xBS/t8kydY7nmvFatURe6VgpqB75H8xOhs8ibl2
         44cfCjZydmZBdyg0t4oQSnThqNsqWGm8iKLPnOTjUlv5O39x+ovfZrlgMqeHkUQrpC0e
         4lLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=6nI+kcxnSPSBF77h45iQiq8r3QwhEKbMHE4rEkzdKKs=;
        b=BaWPf2UdeOxZkB2swAXeLFrr1mk3Ud1ymPMT4luo4kZh66bg0oaXABG+yvX8yYYFxD
         yGNAWz6CDrVtwIi84SdFe3vzbQhAgvgNlhYxPnL1C8EGRGj7n9ZzxciUQM4ANJpLcqcE
         KsfanuQpvq/mUX6qGPrCyeJ4lIEBZc2imdX5uC2/u6qoHwUsl8zVAeRfQdJf60/J284X
         2h4f35pgNHoBOxdXLYPXvNzOMXVB/4ZdHVjJejUOs60KOzeiQMqJI5CxAo3m2nLoL8XO
         I95irX0kn/OHGSe2PiMsdRd8pzBwMhw/rYI8hwdI2Kimt6fkXz6PhHhT3u+Ap+AK1950
         dqZw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUebu4vOWBqB6HSIYQet5V2ai6SE4K1b5YTdC5d23IsHS+CLIdk
	0LFTSjwzeFIXTr6FdC+YgOk=
X-Google-Smtp-Source: APXvYqwFPWFZO9jeEISeqS9+ft5iwtwpmWnP6k4Mp42vr39pNwN3buOEzA2Cjbp3lC8c9dAg6TUmhQ==
X-Received: by 2002:a5d:4d12:: with SMTP id z18mr10122273wrt.139.1581770172525;
        Sat, 15 Feb 2020 04:36:12 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:1f04:: with SMTP id f4ls147296wmf.0.experimental-gmail;
 Sat, 15 Feb 2020 04:36:11 -0800 (PST)
X-Received: by 2002:a7b:c08d:: with SMTP id r13mr11213063wmh.104.1581770171599;
        Sat, 15 Feb 2020 04:36:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581770171; cv=none;
        d=google.com; s=arc-20160816;
        b=wSgD93In4JnfN+03Qt/vCX7iWGvTUuFVc4IyGBr0yIC7BNDVMYHwIsgUxinGrkzJMP
         NEx738WU+FUpP5KS7JQJ+WYG+byB9X5V9x5XIifSGcD9A7W1fPNhpwMiFfJPIMqC0Wp4
         alqnHmhv/kmCwDa0lsLCnY5ITCgaa0vhMkGR45FsovoW+52swmy+GbDlx2BNiJ2/iB8K
         Ew5h1rail5TvW/6Ii8nPTno1ZWbZ7ylmB9bq4hr1IlvUO8B3TAsRlE807R722M99nr5w
         qvJpMxMgrbcyZxZkPYb0vo7cQanplo5RUYx/LEPvtokfLcqd6/eWMED5h/N8kBvJysWI
         jp9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=jKhyjMbwluWRwhThQDsEdT0s9Xp5uNmULBuP4GZGPFg=;
        b=jqgbwfMbgFkJAy1HajQc3FNmGoWlfc8wvEHUUBV+gWxSW0kcWJHOOG3SAp6vXRCAfI
         ueeqbI+XuSJQyja0wL11vf9gmBwp1mLruKB/38f3tx8iJuLP5YXhIa7xIh3MFqOKk91z
         o2fhBtp3TamFskYzULuW4Vt/Zwzx+QpDeZ5IM6hcqAw5XOJokhgyyh9NqD2ha4BZorNg
         t4SKECz2Q+DC5Ol2rVD2PSCv4ipKnsWyOBhN4QOtJTuiuoOu4T/TDkwjtT58xliNNTJA
         2bTMm2xFRZcKiu4bn2/WXO6q3kSn5nCGB9sYRk6OZwUF4WIlYrfjqbpHD9bTW9a2mUDl
         MnCA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=L+qIrUSP;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.4])
        by gmr-mx.google.com with ESMTPS id m2si271719wmi.3.2020.02.15.04.36.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 15 Feb 2020 04:36:11 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) client-ip=212.227.15.4;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([95.157.55.156]) by smtp.web.de
 (mrweb002 [213.165.67.108]) with ESMTPSA (Nemesis) id
 0MAMY6-1jDN3p0fhS-00BeuI for <jailhouse-dev@googlegroups.com>; Sat, 15 Feb
 2020 13:36:11 +0100
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 12/12] inmate: Reorder CR and LF on debug console
Date: Sat, 15 Feb 2020 13:36:04 +0100
Message-Id: <096ee03151b45c8ff0ead2da1cd605be74fbceb8.1581770164.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1581770164.git.jan.kiszka@web.de>
References: <cover.1581770164.git.jan.kiszka@web.de>
In-Reply-To: <cover.1581770164.git.jan.kiszka@web.de>
References: <cover.1581770164.git.jan.kiszka@web.de>
X-Provags-ID: V03:K1:REBTCPf32cLAEhAJ00sVhJCEMc8aQN6F8M6Zqb+ZRJA4Mn/JODf
 TH4DJxRUL3ZVmmofXo6gqbI2FFjPfdaIhLBQiVAg3fh2jIXbNkjLLqdWSN5BTfTcA86ihLp
 tz3h2+rWRwpOf6iElm/vGWGNScTPn/EIU64y/8v8UdjMuqCKcTS7puZ6aot1aj3GxfwPKb1
 szGrDh1NdmS9ivWE2Gldg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1D/vsWS/n+g=:rzcmJ1IgJLVZ90osFsrkYT
 GoBuYAWxIKpqU3kydXqrHPnZwfAZcwFv/ERW/687AoeRWRXfNUbz/1hu6R7wPTEjvaUlKORuW
 Ak25Zht/SdZyrrVVXmtaVOve1CxemfvNwuAXXuX7ajptlKDwYtzsglUcMbvKU39Oa5MbBKJhc
 46BsDmRPXoMJvjadeIzggIuvOyzc9Wz598JPBa4Yw7WPy9l07yuhcs76t4tfIAa8JHxfv64kB
 stWLnmqACd44Q+quf4DizZ3lFTciJ+Wy6GrprXLwpYPBB3xXCA0cuBvV60HPJBKCrUh7SdaM1
 wVSwbXn+6IB242oU5vLUbPGs5zBVBKvKGe/dHuT1Ad/fSQQy039ZUJV/c9DGuI59MiOQwKjZp
 JzReqYFL7y2nO/9RbgVLSFKAxm6ojbKqtLBlZy1uAPRB6/YscW+BMFi2Vxh9gC+u/kZI2W3AR
 KS2CvvzAJw30n1cLABA7gQ6aX9UN1N/xK9t93xoYyzHrRPxbjbS5wpoDz8pENUq6SXmntv0Cs
 ILbcEmBQ5Kh0fNedR2wvPrGHPdzZckBSfeIUnrawXicJgYw93EXRLN1ns1iabsYHkXVI/tijk
 LLti5a14lI+Q8+8+dqCq/ytk06C3IIsJKCR2tKt2ZmNyW4can6vHndMkCnUk9PIz2UtmW69xO
 qW2gPlPCMxDONY4P1YIlTlu96oE3+o9i19LIWcW8fl84T4WGqecExa2K1ijpA75FrCMf4kFSV
 r8UBI5n/BhSJIFZTs2pGCA9bdnoBwkV3Ky0Y6hZe9ewUFra1huzpRdn+ELLa3/DL2nmQA6Us7
 pVBOAJ47vtnMrPWJxcryNk9dYY2/wki9y7j8aFC+HPDT4kvQDjw97KTtqx/ZCRabvUuRGK3AM
 Q/2NAqT00Kibg4ghMfDmyvVIIejWxg81Qh/fm659ErBNi2OpBVGXY5/CuWOd/e0EfNUWxYR5y
 atOmouSeBVUe3ni+isWDfvp2Osy36UXZ0DuVaYwsCzZqBEKz9LqrIZ4f2liwiXS218J9SimAr
 mx8OlqgcTx6N+rHCOG4s5Ng1HH3GPvTNuSmkZ22EgcKGpxdr1cKZymnare4z/Q77eUqL8/Fyi
 tJjyY+E+TOlxfX8iCanlaqHKAfkut7nFeskEEk50VUo+pZ5uHIeY8LW6Stkz33al/vouxiu/6
 M+I4yTap28TENnzOFLHmD+PfZi0Hdze1grwmdUTN7QuA/1VvMTvPrCVolZtBINf2KmGYAljik
 h2bHHlIkaKGgnXjTA
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=L+qIrUSP;       spf=pass
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
 inmates/lib/printk.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/inmates/lib/printk.c b/inmates/lib/printk.c
index 29cbc3f6..45af2730 100644
--- a/inmates/lib/printk.c
+++ b/inmates/lib/printk.c
@@ -3,7 +3,7 @@
  *
  * Copyright (c) ARM Limited, 2014
  * Copyright (c) OTH Regensburg, 2018
- * Copyright (c) Siemens AG, 2013-2019
+ * Copyright (c) Siemens AG, 2013-2020
  *
  * Authors:
  *  Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
@@ -49,29 +49,34 @@
 static struct uart_chip *chip;
 static bool virtual_console;

+static void console_write_char(char c)
+{
+	if (chip) {
+		while (chip->is_busy(chip))
+			cpu_relax();
+		chip->write(chip, c);
+	}
+
+	if (virtual_console)
+		jailhouse_call_arg1(JAILHOUSE_HC_DEBUG_CONSOLE_PUTC, c);
+}
+
 static void console_write(const char *msg)
 {
-	char c = 0;
+	char c;

 	if (!chip && !virtual_console)
 		return;

 	while (1) {
-		if (c == '\n')
-			c = '\r';
-		else
-			c = *msg++;
+		c = *msg++;
 		if (!c)
 			break;

-		if (chip) {
-			while (chip->is_busy(chip))
-				cpu_relax();
-			chip->write(chip, c);
-		}
+		if (c == '\n')
+			console_write_char('\r');

-		if (virtual_console)
-			jailhouse_call_arg1(JAILHOUSE_HC_DEBUG_CONSOLE_PUTC, c);
+		console_write_char(c);
 	}
 }

--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/096ee03151b45c8ff0ead2da1cd605be74fbceb8.1581770164.git.jan.kiszka%40web.de.
