Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB7PQQL4AKGQEABK326Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33e.google.com (mail-wm1-x33e.google.com [IPv6:2a00:1450:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CAB2147A0
	for <lists+jailhouse-dev@lfdr.de>; Sat,  4 Jul 2020 19:12:30 +0200 (CEST)
Received: by mail-wm1-x33e.google.com with SMTP id 65sf20229032wmd.8
        for <lists+jailhouse-dev@lfdr.de>; Sat, 04 Jul 2020 10:12:30 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1593882750; cv=pass;
        d=google.com; s=arc-20160816;
        b=PU7ajcWR0ovn7FT0Gp67SncZpIha4QhJQ1Z3QviCu/B58J8Iaj+TOShsKldKLG7TGS
         xHp9U47QbyedTf17RzcaU6hpPYghAuWZBpF+oJfUeJ0z7izIwdybsIGPF5E77+i9F/ZG
         JoyVracdGOX0zup66iSjZXdT0ms/k0vOMkJaBFj39NLxoliAi9fHMKpczeVE1W+uQ2b0
         I2cTm8NSNqQRbo+h+UBEWO/9NNIuPq+ulUiMPnXJsQZCiX7WgvycKRPaXXqB+gZ2J+Nt
         bHMW0JAbfH4RmAVgJtFGsqUaLDB4F9gKyeta9H2t7Iox/yFgHvDeVDXa3UaQTLlJcOTW
         KOLQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:to:subject:from:sender:dkim-signature;
        bh=4p1kA15GbE3p3jsVjU42G/pyaqTCkjykm/aGr1K/9Jw=;
        b=akj6jYLT1IhkZZjTSnLF3IlbJkrppBVDaKbgOQZMR9X+CIXDwDHL1CkUYKf1krdrcW
         FLnBGvKPaxGj7VECi/OLQJ5gz/0S0Io6IxZmX4S6wWSt+IGItuaj/VWXq4t1aakOuGJv
         Ic5Gml89H294EIaQvI08/h1BAjrd+VlFM0FfmuAj9thrMxi7wOCRuG9uHxN3njJTtUmR
         RVnq8wwIVoJFs9HnGP/mgWVXXKoO8pvMdgtIYh4L40K/FKnznCmRNPpwutF//wqzpF51
         GR7NhxVbbrXdR4/xTGMx1s/MVA3V33MbweCWjtqdCBUHbphibDVuhFb+Fv7vLhnuuycz
         IXEw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="fleO/ABb";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=4p1kA15GbE3p3jsVjU42G/pyaqTCkjykm/aGr1K/9Jw=;
        b=PWBli9YSJV+c3goc7Qb3Eri3oP3Bn+hiKcBYZ2TWrwcZf/YEPM2T3tMRGbcgg7JJVE
         zTdy7kCHYc+lqnaw0Ma2J3G35W+k6yXc1hDAi0+E0F4mMZ8vxyG688mhqqG7CpRSU9gH
         ve9qIztcB9HF/2JlYBJbXg2jrsuJGmYk9AHs7ihDFmYcDuvpLdWa21kb5k6zQQQ8PiOM
         GEnkXUO12mhkIyfxuXVJjWfODoKQMtp3mt24R0SzHW78Ltz1LlluNmUKgvu2zr62Zx7O
         3TknKf0wowUPAkvB35b0Q5Io6dpyrR7RxFtgb0sO2IHPMKmEiY2DZujtW6VjvulCP5Vg
         bV5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4p1kA15GbE3p3jsVjU42G/pyaqTCkjykm/aGr1K/9Jw=;
        b=HpvLKzqp5g7SEndVPVPRA8mWvLDY1EfiSHoE973qK7Ja1HMYXnitmc5SrpoAtebTIx
         O7rqmtn/rtQNwW7upe6PHy7dBIR4fLBgEz3w9jgn3BF1rQIBdFEwgf1QWU1NUIiyuPrf
         a1rGtR2m4nO1lKImIFxwdSUEcKbbEavKCk+pI23YciNaHb28adBB2ci8lHuHcT94Vaen
         MzNblq19mh0B8qb5fa/BBTQ5Zo5fjV4bukwcuOVnVg4tUmx6by7O1cjRQ1m0bkTsFtEP
         looxqoIM9sXlxWoc9iCPmltu7/7UBBnVpk6I789rKa8ymCd2Yu+sqhz+U9JFnSewsoQO
         75OQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533tnoT5oMgbl7NG4L6BMCvL0//38Zp8MzQ75BY5hcQcOJoCWYtq
	sWIoCJ36U2NON1BJrJNy7+0=
X-Google-Smtp-Source: ABdhPJxn7XL/wgHFvKHRY12J4CFRZ0XpMEjwqLz2X6cNY5/iyFkdqCXrUlphUKF8OVdKmhF64kZ1/w==
X-Received: by 2002:a1c:4e08:: with SMTP id g8mr43388584wmh.77.1593882750105;
        Sat, 04 Jul 2020 10:12:30 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:b1cf:: with SMTP id r15ls4382379wra.3.gmail; Sat, 04 Jul
 2020 10:12:29 -0700 (PDT)
X-Received: by 2002:a5d:6809:: with SMTP id w9mr44401724wru.182.1593882749441;
        Sat, 04 Jul 2020 10:12:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593882749; cv=none;
        d=google.com; s=arc-20160816;
        b=VTJfPPNmVvC1U7KRqIbAM54XUfzEkOVd+wBf3pht/rEQLgQ8XfDpYMe9IjBFTl9Jnq
         zonv/EVRMrN+JRTimE3zaGvBIM+2+TpVtPnV+tqwx8ppMY6eovWVj2pp+CF3PleVrV27
         V0/1FCG/iqB3WylXGFV8yhgVp7I173VxHLO8g4SZVKzjz1wzjjjsX5u489A+uwLf0CC+
         h0ogQToVv9+1pZTQCCrRscSDH8BNgvIo2TLlxpHDDMOfY60KsTKeY/Oq0XE+xSv4yATM
         AwYEe0/hy2+TxJbt4pWv2ZudNeZd19R94wOGPrmZ1vxUj8yjE7M5mOZnGb9nLPebCYaa
         v5uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:to:subject:from:dkim-signature;
        bh=70MhyYZmPU7cb/8tV6tPLnEjkpNiqsRidWMGv9FdD5w=;
        b=BYJ5J8Ah7dMiZ5SIvGTOPV2WNnABTku9zGiuHN37nt47lmfnPjB56cny4nOdZMiUYi
         eSzfzQLB5HwiBGA7LX2vget/YHKiUXXTD8MXOdkWrVzL1C/Jkg47i74NmZ8/Qh4khTk0
         C+E7hKVMe26A1pg2QCozPviaVRxgcqXm/PF/NAtvAGCkfGVrHO38Z4wuUtIo/uvw2Y8Q
         mfOtlv+KTX5GsmbiaSN0lNRuUjUI/RETX9k4MFtlPaT20V2ncyIkZizqCL/ICFoCgDQZ
         lo8O8cFJajHYiE+rzrkm9xJpWDu5cU6QRzUyQ+1ZEr0uLvl4wCnOiDUeBzhCgHj9zulP
         f/tw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="fleO/ABb";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.4])
        by gmr-mx.google.com with ESMTPS id q12si1944759wmj.0.2020.07.04.10.12.29
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2020 10:12:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) client-ip=212.227.15.4;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.2.196] ([92.210.73.173]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MLDEn-1js2pQ05ez-000LOm for
 <jailhouse-dev@googlegroups.com>; Sat, 04 Jul 2020 19:12:29 +0200
From: Jan Kiszka <jan.kiszka@web.de>
Subject: [PATCH] pyjailhouse: config_parser: Strip trailing zeros from cell
 name
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-ID: <abda857a-03e9-aff8-daa4-0bc56ab09039@web.de>
Date: Sat, 4 Jul 2020 19:12:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:CFJQKgsMuCkQBEhU7dgRKhOpkjPajujpfcH1LOY/LtZOJNDOvb9
 mHQqSYkIpVOWvvKc6AtOi/opSonYRep7VZzI5lPEw0a5TtmkjiWfVHJxSDY/CGQbdmVgCOe
 7dpfK9DuQusXxgsjTJWeko6o3EjQJgFQcr1c6ckT9NiuZQYz8ONQBo7ncNXhanCzJNkhrIX
 nF+3sOs8t7I/8q6qIAFWg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:pLNlCsqzJQg=:5J1g58DpRAaMPhMn/cDUVY
 jr55Wwm1y9QqG2RJdq51kH/H0PV80mlRWWkqgxVxBC+rrLVNJEMQ4jVfMIGKreta9eZILwu4L
 gPTRAAvTlpqIWjXel2eZ8B2Mjk9uuA+JWSBypIWXEib5E1xGW6JIF5aYUksApFV2mh0PqEvJE
 JjBUgDStRu0V2RhadhCEuhoj18VHZcq+0F4R6zXiZoNgUF4/tYl2ml3Kc4ve1MjWeD1Er+KNM
 eoxLrVuwsM5xKW/1jhJm3E+DV1exPQ3wP/KHt0olwOWMYOaV582oVa/e5xUSuY9MSVGV7VjXW
 IG5qVgyARIPnapwtXYm244feO1co/n5QVIuib4mslHvmM2RDmOr39bYmsaxWo0T4ewSr86bNo
 +az0BH5T7YY2GcEMPlGJhEB1kM9mZPovWZWowc1Z5g08/vvvEclnBVW4DDlG7L4Pj+f2seveh
 5Ftn4+Nm7Mt13dxAalX/BdDMtew2ngzfUsM2UFsfxin54x3fv1wmUXJN0qRgQKDJpH2zQ7x+N
 baFuZIh9q1fduLBYzDQ25SvnGKkTI4cetu62uS/wnok/RBQ1r4EKCQgIQwm7pndgf/mwpymyk
 T2ek1t9AtYbrBQ7NEOcA1JzNz7+7qTHs8g1dSiO2rH0/3LorF1Xb+05+svksgdv6y/78/noFI
 w3e37sQGZZf/N4ne+MSHdnCb8P7V3mSuf9TK7KmAA1LvYLqcny3pn8/qszTZMvV8CM7nEFK68
 56A6axktzmSAOP8xDEzMfYkIwyYx5+hBvC26ovaBpYsgtUJ0PHauxchRriVmor+KpBhtCM3QC
 9GvfpunKff8T+1v9sdynqknUb5AzJNaEMhBU01yG12KoshlxwM0dKnTt3x3NGP7H5Wha2Rr+/
 OnbXWYUctJq9QLm8NiFJKiCBn8/Vu51fxb+EA9WhH6Lw/bsI+6sJcdBqvKGo4rNHG3IhuijAi
 h3cIP7Mb3yqmeuSmdivLFt+6cpSXkgY1Xsu3KvX94DrxmlhMTFQBCjdiy1K92iCtup0KbpFEi
 4BJ6mHcr7Liw/wpTEb6ssBMaMRivtBnhBUihRsFO87ku9FPSf0BEBIvEKV9Wkv2AjUCzU1A89
 cfSuzhz8jJ7LGV+XbnmCD/yXI22zukcnukdPWuSyRtJ4BEHG2zbL8QZK4le0Qx7mjqr3/z1YG
 5mKOiLY5fhij29q1pkpMu2OeG6/M4lj4wa7eYvAD1ipqlSTgmKU+PcRqrkQBWqNbUlXKs=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b="fleO/ABb";       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de
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

A cell name is either terminated by length or by null-byte. Avoid
picking up the latter into the python string.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 pyjailhouse/config_parser.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/pyjailhouse/config_parser.py b/pyjailhouse/config_parser.py
index 6b9d9066..47350c6f 100644
--- a/pyjailhouse/config_parser.py
+++ b/pyjailhouse/config_parser.py
@@ -162,7 +162,7 @@ class CellConfig:
                     raise RuntimeError('Not a cell configuration')
                 if revision != _CONFIG_REVISION:
                     raise RuntimeError('Configuration file revision mismatch')
-            self.name = str(name.decode())
+            self.name = str(name.decode().strip('\0'))

             mem_region_offs = struct.calcsize(CellConfig._HEADER_FORMAT) + \
                 self.cpu_set_size
--
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/abda857a-03e9-aff8-daa4-0bc56ab09039%40web.de.
