Return-Path: <jailhouse-dev+bncBDEIB47USAFBBY5LW2PAMGQEU2IOF5I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x1039.google.com (mail-pj1-x1039.google.com [IPv6:2607:f8b0:4864:20::1039])
	by mail.lfdr.de (Postfix) with ESMTPS id 3076C67722B
	for <lists+jailhouse-dev@lfdr.de>; Sun, 22 Jan 2023 21:00:38 +0100 (CET)
Received: by mail-pj1-x1039.google.com with SMTP id x8-20020a17090a8a8800b0022941842cc0sf8286044pjn.3
        for <lists+jailhouse-dev@lfdr.de>; Sun, 22 Jan 2023 12:00:38 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1674417636; cv=pass;
        d=google.com; s=arc-20160816;
        b=IwqbmcaA3NArVE7TSLO1I2N8oC1FQ4JKuP5kHZoIRVUnjOXEJlZ7vTe+puh7JLmJS8
         Xqt1U/bRaGtnjhMmUiaXT7hqSgv3yBof/WRjuhh6GTFmk1XLMg4yplE3fUh6ZCImBcAU
         wSmVDkib5AKPX3Toktur35co7KOR4M4T7ktMoO2LUcisQf2aS3BUjS0fBFgkeib7N3bE
         1TgV4m3co+VJ7d34lOQ2wOjfrzOlL28gfl88g5yJJy2HnqtRPY4Mk9nsIUV3WfevTwzv
         WUE1KFW+JXdp3YbZAos7AARErug2O6EPyRqmYoOxRi5bsY4UokVc/9DVDmaUHRCnFAK6
         VAfg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=tiyu/zfkw9eI5DwinjWaa4dj7UuUrRRzOGDNC+lkJN0=;
        b=oELJyRraAI+j8YJ/CgEQ2gqKaD2ICzRbWAgKZT9Q5WP3XeUTdlxk47MNodZkxjyxbd
         5iPTvUd7hdXWDopLLsPAnbu6ruNiLpbkwgyDhWCTtC9jxg559LpYI6uoi8zHhTAclH23
         mQrjioStdXK4TXGGy4ADFIOp/OKs0Xclrtf3aS4elXlJ/KfgUHmOBxTU62wTpF/qHdyB
         OS4j/vJHLWrpabCjjbaOnPbIEzZ1qBKKIRiveXJ6rR56HaK0c8q7XRmv3TTNsMfyK2cf
         uyOLnFJhM53f7nHzX+SM/Y+cBDZqrIBiXdcQUg8bXQlG8d7YqjUrpl6SF05zwhipH1AI
         LGOA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=BibzqcoA;
       spf=pass (google.com: domain of samadapatrick20@gmail.com designates 2607:f8b0:4864:20::92a as permitted sender) smtp.mailfrom=samadapatrick20@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:to:subject:message-id:date:from:mime-version
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=tiyu/zfkw9eI5DwinjWaa4dj7UuUrRRzOGDNC+lkJN0=;
        b=shj0PIBNdO4ML3ArCKAbSidmNAVO2Yz8g8C6TVw37HMcxIIta/dTmhxpFZ56lVIQ0/
         Kr6NEUg4a3EM0891ghwG9zHBOk88vxsoteuD21a9QWYPFSQzwYU5yLmEtGYEaQpDIX7Z
         FveNO4qA1x/8REvMwA5IUxUVw6yt4HtPr0VccCsKkuNIcuYKNK1JC1YiV/srxIYaNtox
         VVFUSmkovF1B8Yfn+chOwsU+7nftgxjoPhkDn/rxp1+ycjwSJ4S3eENmDGdwShigS6if
         Gfzfk1GNNy21VCErChzbQ+zNXj7naEuoPHJGb0aWGe8RpEQ6+wLZcZZVaHsOkXez1Vxd
         u+mw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tiyu/zfkw9eI5DwinjWaa4dj7UuUrRRzOGDNC+lkJN0=;
        b=T9plkpBRRRQh3RdeOhiF9js9ljBIPMWXrODcGOdHvjqn2P/Y7X8QGtOMZ4/k6FYcpS
         FXVoZeTJY9w45ESBEz00zdUJrtf3ZA1Y+qJehiHGv/fzNJRRyux4/oWO6XsvVIHk1gx7
         uSPtDAN6BiRQ2wZfLtc600YMp//uHkXVFQfrc7E3Fsn1JfKSbuwENupTowCv3fj+Hjx/
         YGM+n0N9gVxkx7zMYLXHRqWTcT9yfZIR0r+hT7Mqr4Ug70q6plfQTHHRqpPcBHlyE1kG
         sHg7PG0GekAmy9xMYBPLU+KW3ASa62JM+bTni/1scJnOHtF67t803ZL5yckjrX7U64gf
         hCmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:to:subject
         :message-id:date:from:mime-version:x-gm-message-state:sender:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tiyu/zfkw9eI5DwinjWaa4dj7UuUrRRzOGDNC+lkJN0=;
        b=hjHNnsZugKY9Zr77hmxkifZ/kZ+wpzOtls9c/3MZty5MeRXAK5DwqKplFUxEnJFId1
         dfkxjwdkSnO7ZkTKiNMUf4fHMWSTH1X/u4HlGjhUJvq31F0dM7Wifp74lVxjNir6U7Fj
         bjNkA7elUWXLQ5nwGyGYUePS6wG5W22+Pi//ZgG8rqckx8u+Yj6itQdPmMFUOZ0IViCe
         mdGh09JbLUJQyZfdNCs8wflZoJSGwmEhAJsv8CAfV0zyJVqSo48IWq35rWuFJm4ob/uo
         V26y2oXZj+cxrq150cp10S5T0Mfy+e50AXKTSeElWleBry7X8FXxTPSYURbfeB3pIACP
         u4XQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2krmP7NSXHYo1rNg5rI5w1ObzU7alYFFzUm4/CAnlFw0w+cECBKD
	Fg5iUV17HqYH2kUS9pGCiBI=
X-Google-Smtp-Source: AMrXdXv4V0tB7c/jfYMpduRSM23W5nWoS5zkrofggiSmMNoR5bny8FUh+PspJL13+TR0TymuaWNS2A==
X-Received: by 2002:a62:ea13:0:b0:58d:aa53:514 with SMTP id t19-20020a62ea13000000b0058daa530514mr2587244pfh.72.1674417636140;
        Sun, 22 Jan 2023 12:00:36 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90a:3801:b0:227:1b53:908c with SMTP id
 w1-20020a17090a380100b002271b53908cls14438788pjb.1.-pod-canary-gmail; Sun, 22
 Jan 2023 12:00:35 -0800 (PST)
X-Received: by 2002:a17:90a:f604:b0:229:9627:80b2 with SMTP id bw4-20020a17090af60400b00229962780b2mr22848169pjb.46.1674417634913;
        Sun, 22 Jan 2023 12:00:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674417634; cv=none;
        d=google.com; s=arc-20160816;
        b=GMSrJGd3JSagN1ZJHYE8d9fd8DIsAE6xwHA9UNUkoeZ+QNIvpYDU8nEkZrJR//Ew5S
         vx2AqKQZAU5dupZNjDBZJ/rx1goaX4n3x49lM75xrnBcwPzWJY4h5QyW/iC45pVCbBxc
         w0aL8APWtuZE9gJ5atup9jpTcF6xUI0eaotbBzMoTnrfDH3zjiYnMp7C+G1GridHD3Ad
         9xbx/CHNV8lC5c+dseFpb/m4hskEy8tZb01t27lnjQHnuFKV85cFNV+xExaLiSUShkSc
         OjNJOLDhBjnVrYyZ73YivHcvfFlA8kS7tlcqxSHodajB7KF5HYI0DdwsMexVIMns3lSm
         Gg9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=6pbBws8o/QD022e6UNK1e3L998ad6GAVoZX7Qe+yK6g=;
        b=SX7mqHASxD9+m/UzE8GPB8WuExBfFx98z48EEgLt2/Tqx3Vo0Tx07AhI84TO7qZI8f
         MCYPCWFlSVK7wy3J5JWIc8eKrwHKzTaZEnjCA2YL/oBHNrMQL+0DFUqCXSqUBwc/ZGI4
         gn1WsVXlRdjLSlZRaC2bqbIeU2lGRJQPJMH4tXRfIv9lUkZd4V14e0FefsMaUTU2wnD8
         f9qk0+2oznTY6Ttl18ufG8p03vWpp8jjmXcqK4eIbyUFdQIaKRgIGJeb3hM/irIYN4hF
         5Of24h0mEosqWt8tIappzlTgqUZQvmn95JTZOaT5PG68sU4xECBEFgaD19kQzB149Fs7
         9Z7Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=BibzqcoA;
       spf=pass (google.com: domain of samadapatrick20@gmail.com designates 2607:f8b0:4864:20::92a as permitted sender) smtp.mailfrom=samadapatrick20@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com. [2607:f8b0:4864:20::92a])
        by gmr-mx.google.com with ESMTPS id g4-20020a17090a9b8400b0022bad3e05edsi862938pjp.0.2023.01.22.12.00.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jan 2023 12:00:34 -0800 (PST)
Received-SPF: pass (google.com: domain of samadapatrick20@gmail.com designates 2607:f8b0:4864:20::92a as permitted sender) client-ip=2607:f8b0:4864:20::92a;
Received: by mail-ua1-x92a.google.com with SMTP id b18so2421536uan.11
        for <jailhouse-dev@googlegroups.com>; Sun, 22 Jan 2023 12:00:34 -0800 (PST)
X-Received: by 2002:ab0:2b09:0:b0:5ce:206c:969f with SMTP id
 e9-20020ab02b09000000b005ce206c969fmr2360052uar.60.1674417634134; Sun, 22 Jan
 2023 12:00:34 -0800 (PST)
MIME-Version: 1.0
From: Victoria <victoriasollomon23@gmail.com>
Date: Sun, 22 Jan 2023 12:00:21 -0800
Message-ID: <CAAqy1pHvayU3Vbv160E+xPVkmwkMJtUcKNGKU9FM8najf3Q2-g@mail.gmail.com>
Subject: 
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="00000000000049ccdc05f2dfbc7c"
X-Original-Sender: victoriasollomon23@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=BibzqcoA;       spf=pass
 (google.com: domain of samadapatrick20@gmail.com designates
 2607:f8b0:4864:20::92a as permitted sender) smtp.mailfrom=samadapatrick20@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

--00000000000049ccdc05f2dfbc7c
Content-Type: text/plain; charset="UTF-8"

hi

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAAqy1pHvayU3Vbv160E%2BxPVkmwkMJtUcKNGKU9FM8najf3Q2-g%40mail.gmail.com.

--00000000000049ccdc05f2dfbc7c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">hi</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAAqy1pHvayU3Vbv160E%2BxPVkmwkMJtUcKNGKU9FM8najf3Q=
2-g%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups=
.google.com/d/msgid/jailhouse-dev/CAAqy1pHvayU3Vbv160E%2BxPVkmwkMJtUcKNGKU9=
FM8najf3Q2-g%40mail.gmail.com</a>.<br />

--00000000000049ccdc05f2dfbc7c--
