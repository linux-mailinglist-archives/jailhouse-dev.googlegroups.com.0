Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBOU3TTTQKGQEX7JAGQQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x539.google.com (mail-pg1-x539.google.com [IPv6:2607:f8b0:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B3428C32
	for <lists+jailhouse-dev@lfdr.de>; Thu, 23 May 2019 23:16:44 +0200 (CEST)
Received: by mail-pg1-x539.google.com with SMTP id g38sf4660339pgl.22
        for <lists+jailhouse-dev@lfdr.de>; Thu, 23 May 2019 14:16:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1558646203; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZZWn+g3/9IqZzgWjwF2SHntcvsk7YJDSGSruAhJEnSH6tJA5g8U8evl6300OgE1L2U
         RZSf92NUquw/ewpIa3CFLJAICBxYnFEMYWw3aObKpE4LhJZ67HkVCby8P6utAex4c36m
         NKFm26QRXwD6sdQGsWPnfJ/4vKkWateiB5H1YtqpBkFc1DPaLJe8jbYxL4GUrIq7GnJK
         7Y2xF7YwNC7qqSZkn+K/rLoG2tzDOukaWeiU+ROiq6xYfFwGgHG7m0X1z1Gj2NnxlTxj
         anlcgifiKAafBvAbiNwpE4YHqQlEMjQhn6pomHeK3m06ymjn7hXeGzUYzFTCZXvgFUY8
         cZug==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=k8XB5tHcJGLUXc3BY50jFdXk5ZL+UUH5yek7XyT1VF0=;
        b=gtUVQJUcrisvHNWV/nCPtSkymr1+bKTSov/9tUeYXaYNhtwDTgjfJuqJudCCyyrmGW
         4m8m/sQKiuYZku0VdD5JY9y93VHH1R8Zh8ruNsLLbgkzl0tBT+HRUGRAYEN/ljCGeT98
         BfiOHpmO4QEWZgLqy+APAneqBel9uua25ZxokB9dglagaV6/n5Iy+hvxajXuejNK8wSy
         mIlTndAIk+aCTYG5zFGDlJb/kur5eSV5TLDjIpzjEl1595HmS9MzjYsNh2ebfSjDr+T7
         u3xC2zRldl6Grft9FXkCmY0eqev49F6C6AxX2OmfPBwImde0SZ5tuieKhS6QCdKO0pog
         EQng==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=nyZ8Ap2U;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=k8XB5tHcJGLUXc3BY50jFdXk5ZL+UUH5yek7XyT1VF0=;
        b=Gsmv56uDasQrhlhKtADtjf55XYCehLlsHWauaudRmnJgieJSdvnRuajDmeK4rKWzqg
         utcFDLvzCwqR2LAS9MqPYbnKK79n73/P2fryqhssAKrwp2zFQSPokcjPit3GQonD3qln
         JdCNGLaNqOFNPelW9zuxEW8vHhVx8ge/Vvv6JRtFGwFVl3W4ZiS0dE+3f4GyYALjkimc
         L0BXHTfDDVVGW5/jb6GxnN03+ZvB9OH+rQvzFFY/p+XDGGEN0jd+5vdqz46t8+h+U5D4
         nZ58TdDKlbvh52Pq4x2zYfWkFmf9iUl49Jhle7JL9CgmK9v1R7mdKyPfemSyucJf7Get
         tP/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=k8XB5tHcJGLUXc3BY50jFdXk5ZL+UUH5yek7XyT1VF0=;
        b=qRAp7adIUpJM6N/o6Xc5lE/Mmj+p74bCIS2yidOP9cWz3uauDuUroshKZZuo55OtQW
         KulA4M/3aTXiN0xhcXXqSWZIpYuN7QKPfhscOCPuRSrlqSfDWHszDp2BmEVdcDAgsHps
         xjWcMjNYx7C/lfgBNl7ruJ9jL1CJCF4FJ1pdZAfhpr3sseMrcsl+8rfFgk1D8ObN/e25
         2rOcLf0jt2zrX4D5gzxyieE/z2I2ulM5rcCEGFHEmpLG53eSGqtvZybFZ2+MLQFk+Ypl
         OIVsiPduIPqjPUTmu0+bGhLZay5+zTMNWIfOxyFjAXo5YqMllqKJ+KClKnNyQ8QVu81u
         zseQ==
X-Gm-Message-State: APjAAAW7TKNvgpHrr7xUVCxkTlcO4dOvLv8hZpG9Kjd9Ptb/bIVkii1W
	qP0j9Y3aG11hoFK8LDw5nis=
X-Google-Smtp-Source: APXvYqw5ZpHfJxZKtFb55HgYeMZUVC+BjWYE0VvN39bNRHTkKuBZWTN5etgUn8DVGw5eNfh/xdxdAA==
X-Received: by 2002:a17:902:5ac9:: with SMTP id g9mr101539100plm.134.1558646203033;
        Thu, 23 May 2019 14:16:43 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a62:7dcb:: with SMTP id y194ls1178941pfc.5.gmail; Thu, 23
 May 2019 14:16:42 -0700 (PDT)
X-Received: by 2002:a62:e718:: with SMTP id s24mr21311848pfh.247.1558646202513;
        Thu, 23 May 2019 14:16:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558646202; cv=none;
        d=google.com; s=arc-20160816;
        b=WVMnu2pzilMv9XvbmcTS5Gm+7K7YQexuWO+9sLzSYEAW/InnU9VnZPA9Ji+3uVY24i
         w8+LY2CEgM9AdG5AG+fF4OFpNP+wUkgyNvjZt3ApwAFyq0TGMCk91IOK9Ldq53MA2tRj
         pdYNRTz4RWe3A6dcBfPWS0IsRW5IS/W+KCEUTVz6TpJmIkEXKgjOKsc2KpO7sjEzLf0E
         51rJRdLoqsIqNUQNVstasjjX+Us2kdNz/8AjzTtJDxj872oAxPcVBgHASAre3Gj0xGxf
         bdH97EcgsM/Bp2+4OMnouJBX6lki9t2pjmpBpx5OEVzVVJQguj37tYGOtgn2SKdttglH
         O2tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=AqF2TTTwDkguzdBTEvXVRUrZESvaO8A2JQuEc+egCak=;
        b=gYdRl52t3GlJuDJ+f51lMMJJ1k0vZIBPV7h/dJmWdYVpDKls8BpsOf1771rJECymZC
         frugudl4cvGS+iJQvSGExY0tLRv1QPIPWgkDRKr37vPiJPXTo7UmDUzVMMJbMcUujL5X
         j2udg/g10FLMorFC2HMEoRxT4yYyP7KqkzUhkLpMHS5W0Q2pTHZXzXnWGy2slOxNP9LL
         1z+PgsgLP6byAj9rprUL3V3mey8xkUU/0hQn9lwfaBleIr/BBFh3z1NQUC41RRGKaNcr
         bFD8qZYM5J7Z3aAbFw+Hqj+1pXZmBU7YJLHsNRztHKR2Ky5YmgeJGlWu9Tigg34qL76J
         My5A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=nyZ8Ap2U;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id r135si31521pfc.4.2019.05.23.14.16.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 May 2019 14:16:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4NLGffC059365;
	Thu, 23 May 2019 16:16:41 -0500
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4NLGf9i091687
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 23 May 2019 16:16:41 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 23
 May 2019 16:16:41 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 23 May 2019 16:16:41 -0500
Received: from NiksLab.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4NLGfOb116843;
	Thu, 23 May 2019 16:16:41 -0500
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, <jan.kiszka@siemens.com>,
        <lokeshvutla@ti.com>
CC: Nikhil Devshatwar <nikhil.nd@ti.com>
Subject: [PATCH 4/5] inmates: uart-8250: Add MDR quirk for enabling UART
Date: Thu, 23 May 2019 16:16:22 -0500
Message-ID: <20190523211623.9718-5-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190523211623.9718-1-nikhil.nd@ti.com>
References: <20190523211623.9718-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=nyZ8Ap2U;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted
 sender) smtp.mailfrom=nikhil.nd@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Nikhil Devshatwar <nikhil.nd@ti.com>
Reply-To: Nikhil Devshatwar <nikhil.nd@ti.com>
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

UART is disabled by default on TI platforms and must be enabled
on some platforms via the MDR register.
Do this as part of uart_init for 8250 driver

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
 inmates/lib/uart-8250.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/inmates/lib/uart-8250.c b/inmates/lib/uart-8250.c
index fb7940d2..42b0979c 100644
--- a/inmates/lib/uart-8250.c
+++ b/inmates/lib/uart-8250.c
@@ -49,6 +49,7 @@
 #define  UART_LCR_DLAB		0x80
 #define UART_LSR		0x5
 #define  UART_LSR_THRE		0x20
+#define  UART_MDR1		0x8
 
 static void reg_out_mmio32(struct uart_chip *chip, unsigned int reg, u32 value)
 {
@@ -67,6 +68,9 @@ static void uart_8250_init(struct uart_chip *chip)
 		chip->reg_out(chip, UART_DLL, chip->divider);
 		chip->reg_out(chip, UART_DLM, 0);
 		chip->reg_out(chip, UART_LCR, UART_LCR_8N1);
+#ifdef CONFIG_TI_16550_MDR_QUIRK
+		chip->reg_out(chip, UART_MDR1, 0);
+#endif
 	}
 }
 
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190523211623.9718-5-nikhil.nd%40ti.com.
For more options, visit https://groups.google.com/d/optout.
