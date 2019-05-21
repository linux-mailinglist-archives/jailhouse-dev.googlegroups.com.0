Return-Path: <jailhouse-dev+bncBDK73PWO4MPBBIX3SDTQKGQE3KIGEXA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x538.google.com (mail-ed1-x538.google.com [IPv6:2a00:1450:4864:20::538])
	by mail.lfdr.de (Postfix) with ESMTPS id 98ECD25737
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 May 2019 20:04:18 +0200 (CEST)
Received: by mail-ed1-x538.google.com with SMTP id g36sf31859759edg.8
        for <lists+jailhouse-dev@lfdr.de>; Tue, 21 May 2019 11:04:18 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1558461858; cv=pass;
        d=google.com; s=arc-20160816;
        b=MN4yu8zTgDMJZ1N68RO0OntL41cuLkZEuFMmcZoQQ8SvWKO0ZQiC+//xdlBKNttwGh
         vPdT8GXJx5/pQmgKsEWEjHTEi7DeadogiDjOG0HkZhIKTSAjNuHA96lYJjRMZPzcgJen
         p8s74NPveE2jydrFvF6dH88dD9SxAC5tjxE55uaawBK9uMGT7rRyb1XTjZSJJIqSjwJO
         /dXTdw0vLEsHJf+QrlYP4JuvGyCmDlJb5vTqS4QxvToUZepsQNVd3Fx7ZKX7fCGhJ3yE
         23L7hQ8NzqrRpkAauLu8k7SCJZWr++QNyZqphFh26bRpfCdSyaSbtrQLNfb69d1wYvz4
         0Prg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=2k7YSupCsZCoG4MQ8VKwfMlv5VUlF6HkessVvJ3nXRo=;
        b=R1s+Cl8TOsvTQ8MxRVFJkOgPXk2cvdvcduwoqWrbjBY+njgLrfKGWQliVpwAEmVcm8
         W3FLTaw8upeAXr0fydABfhNRBQrcFGISYPZDr11efkw8CDlWFjH9WBOYSEqru+YN5Boc
         HwFx30/CPJEhkApVk/WPnas1XoeCHhD+1N/UbGRVsxSwE34ldFdNFNHC1XIKxlYzdJZj
         eKWzTdZNMzFXtgbD8JJ3BisSOjBIJWov+hJ28H7WTnx0nUISPx3+p3KGT3hX0wUHkIOJ
         +eMuBt9nPqDFso0hOjSoj+6RvE8w+IVNQHsP+2+O99sVT+fzqUApi8nGFRuP7BD/ECae
         BKpQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=bAOpNaYm;
       spf=pass (google.com: domain of yassershalabi@gmail.com designates 2a00:1450:4864:20::534 as permitted sender) smtp.mailfrom=yassershalabi@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=2k7YSupCsZCoG4MQ8VKwfMlv5VUlF6HkessVvJ3nXRo=;
        b=FHZdEybqAdTwxWxiFEPCmIBUDm8Y613rGorH+fvdcDWwSU3FVPVUUs9S63ON0uQwHm
         vv0LTA9Tg8HQA6ZUJf/BqwkYmBmQaFENNRynoU1lWRGc8FxYw65DNJYYjLL8Er3K6TrO
         diqpCQuR8b3kufo5JoD5x+bTMIiFBF5ERMstSv8/vR8gAwjW7b0Q4+ZuWBglU5wh4DN5
         xbPbBqOVQASrfYixgF4o94ePZVtvy1yK+h0l5d5BjP+LZjDJUj1zk4Kaj3Rxxa71BvKh
         s//9QXb/3yROYjgaTBEcuqnGGnJBZNXjz+k2srEyReNzBJLw8QBD6zx65f99DS2kEsp8
         nKng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=2k7YSupCsZCoG4MQ8VKwfMlv5VUlF6HkessVvJ3nXRo=;
        b=c+LjQr3wmSev2a625Jo1zO0jJoiM/o487nD+1//jPj5vpvlzza84Ig58U3FR/wtKe5
         2YCxBv0aR+tKLirTmwy+g5ZHSSoQ9bUc1xfmNkrTyuZZ5/KFMFINDYiWoOgAQIvYYtJH
         6a47Dq8ia7Q67Axaxrlmmlw5nB2yiGn0y3zZc4lbz2hdrz8QnYcGHEHT/mz2BR++kwUg
         UEkUBuJEBYliHw79CJFoklUnlW+WvdAa/BU3dNl9VA79XYWOvaAoqPzha2sAO+Adgry5
         iY2X3XfRHotXahp7FQkF+LlyDutu0aeqGfGluCdau3Z10vH+29Kew0POwLpK1RceM34R
         lf2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:date:message-id:subject
         :to:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=2k7YSupCsZCoG4MQ8VKwfMlv5VUlF6HkessVvJ3nXRo=;
        b=jm9v8AaquqH4XMxEkqxoYjIC7lH7/DUw4PBncBW1bihUkTNWmmLprFg8TlKep73G6w
         GLLnGIFGW+ubeH9R1Yld4ULlWmXWZuil1xj+1AB2zYw7jX3MLihajlTV3LasWtNjK3r4
         TK6xChHU5ubY4DvddTXLe5qP6kwSud0oUY77qJREIlgW5XgET1RPxRhdB49XFcydQE+X
         xuD6rr2lNNRBvX9e8FNB8MCbQ9ngnTMQzWiyXYABc72dcmSRiYME9ESTtnKVPlrt+3u4
         ve7h53fC1fU7dtrCryLxkSI6ysNz/m76GVYGkNa2sIcmPF8pAVpHBgcOZj1eM2U9Ju2H
         wHiA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVvIRH7ikEYiT6/4vxCzYiw2xciTiOokXj7UQ2m+FYsib63vudb
	1bZJl+w3pJOGYMfaUE33YYc=
X-Google-Smtp-Source: APXvYqzzFDg2qfq1cgPkGdjEVo8dX1idqrsziQYcdivIBFqauCLzrM1LS5Y4ZzXagScXmYHJdV5rmQ==
X-Received: by 2002:a50:8818:: with SMTP id b24mr84970911edb.28.1558461858394;
        Tue, 21 May 2019 11:04:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:22d7:: with SMTP id q23ls4945413eja.12.gmail; Tue,
 21 May 2019 11:04:17 -0700 (PDT)
X-Received: by 2002:a17:906:7047:: with SMTP id r7mr22876218ejj.11.1558461857722;
        Tue, 21 May 2019 11:04:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558461857; cv=none;
        d=google.com; s=arc-20160816;
        b=KHODfLjKFfD6i0gQ0/Nho/RWN3VaQFlcYyk9WqDxJEp+K+hDoM00bsP5HZlkqwASgP
         j6QihBZds0AFwIGYn+91ltd/o5RpJsopQ0YygxeAGs6tCL1n7SU7TeMDM2lyzN44/H8C
         Hr+mbFKHECC4TGa4OpMrXwj60RuLDQpwa/+gQhNF7GoUILLsMnat3RwKhbFD0mdLmvC6
         qfJJmz2goaqsQeXep3tBHyRUeRKvYnCdE0uRJSfJfwMfdckJ7QTbBvFmg0S8T87vfMjf
         6Hk8Prgidui0KA7Qv/3pxSZ8JJQAtF+a0kKNORRpQcGbHVx9GmkRCnivUAbk2fIrI7Yw
         n+yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=AK4jxGr/HN9kbGx9sIqsDM1I7GFoNGiUA3RkAgd9qbw=;
        b=ryE3Zlx83iE254KEc+x7zGg70orwQPCPFoOtLrjH9OvrJLZ5+Q0mJUy6qCh1X+hsbU
         XqrGUtKx8wVsk8yGx+9i1zDkBWmiBx9MdrBgTEfTTnFoGAFONDAjnD0FSHutiOwjS6U9
         WDpkfenUZHcOHkZBZXMAv/rUxGbqeuFxNjFKn8uvXAkIVfHhwkra2khSCLoNOvrJuypF
         3RdN+1mywBEHS5WR9blpqtKXQWq/Uc7ZrfgCMIvkTt5UgH/eaP+VTdPmcrHVc8+EQzM1
         ZouAgsaXorTTqjykB1KcJi9/ZCTQnbJFHOgCDAn6DRukIfn09Aqlfjd1z6IapNxbxsm+
         KvtA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=bAOpNaYm;
       spf=pass (google.com: domain of yassershalabi@gmail.com designates 2a00:1450:4864:20::534 as permitted sender) smtp.mailfrom=yassershalabi@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com. [2a00:1450:4864:20::534])
        by gmr-mx.google.com with ESMTPS id w5si2468660edw.1.2019.05.21.11.04.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 May 2019 11:04:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of yassershalabi@gmail.com designates 2a00:1450:4864:20::534 as permitted sender) client-ip=2a00:1450:4864:20::534;
Received: by mail-ed1-x534.google.com with SMTP id p27so30751012eda.1
        for <jailhouse-dev@googlegroups.com>; Tue, 21 May 2019 11:04:17 -0700 (PDT)
X-Received: by 2002:a50:91cc:: with SMTP id h12mr84377258eda.3.1558461857004;
 Tue, 21 May 2019 11:04:17 -0700 (PDT)
MIME-Version: 1.0
From: Yasser Shalabi <yassershalabi@gmail.com>
Date: Tue, 21 May 2019 13:03:40 -0500
Message-ID: <CACkfA5uv_wSnv6tPozNx4eUT=H6v6cmLex85VmXRMs4FWQ4hBQ@mail.gmail.com>
Subject: [PATCH] Update CR4 reserved bits as bit 22 will now indicate support
 for Intel Protection Keys Extension.
To: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: multipart/alternative; boundary="000000000000620382058969adf2"
X-Original-Sender: yassershalabi@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=bAOpNaYm;       spf=pass
 (google.com: domain of yassershalabi@gmail.com designates 2a00:1450:4864:20::534
 as permitted sender) smtp.mailfrom=yassershalabi@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

--000000000000620382058969adf2
Content-Type: text/plain; charset="UTF-8"

Without this users running on recent Intel processors will not be able to
use jailhouse.

Signed-off-by: Yasser Shalabi <yassershalabi@gmail.com>

---
 hypervisor/arch/x86/include/asm/processor.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hypervisor/arch/x86/include/asm/processor.h
b/hypervisor/arch/x86/include/asm/processor.h
index 50b997cc..70a6c3ff 100644
--- a/hypervisor/arch/x86/include/asm/processor.h
+++ b/hypervisor/arch/x86/include/asm/processor.h
@@ -66,7 +66,7 @@
 #define X86_CR4_VMXE (1UL << 13)
 #define X86_CR4_OSXSAVE (1UL << 18)
 #define X86_CR4_RESERVED \
- (BIT_MASK(31, 22) | (1UL << 19) | (1UL << 15) | BIT_MASK(12, 11))
+ (BIT_MASK(31, 23) | (1UL << 19) | (1UL << 15) | BIT_MASK(12, 11))

 #define X86_XCR0_FP 0x00000001

-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CACkfA5uv_wSnv6tPozNx4eUT%3DH6v6cmLex85VmXRMs4FWQ4hBQ%40mail.gmail.com.
For more options, visit https://groups.google.com/d/optout.

--000000000000620382058969adf2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Without this users running on recent Intel processors will=
 not be able to use jailhouse.<br><br><div>Signed-off-by: Yasser Shalabi &l=
t;<a href=3D"mailto:yassershalabi@gmail.com">yassershalabi@gmail.com</a>&gt=
;<br><br><div>---<br>=C2=A0hypervisor/arch/x86/include/asm/processor.h | 2 =
+-<br>=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br><br>diff --git=
 a/hypervisor/arch/x86/include/asm/processor.h b/hypervisor/arch/x86/includ=
e/asm/processor.h<br>index 50b997cc..70a6c3ff 100644<br>--- a/hypervisor/ar=
ch/x86/include/asm/processor.h<br>+++ b/hypervisor/arch/x86/include/asm/pro=
cessor.h<br>@@ -66,7 +66,7 @@<br>=C2=A0#define X86_CR4_VMXE					(1UL &lt;&l=
t; 13)<br>=C2=A0#define X86_CR4_OSXSAVE					(1UL &lt;&lt; 18)<br>=C2=A0#def=
ine X86_CR4_RESERVED				\<br>-	(BIT_MASK(31, 22) | (1UL &lt;&lt; 19) | (1UL=
 &lt;&lt; 15) | BIT_MASK(12, 11))<br>+	(BIT_MASK(31, 23) | (1UL &lt;&lt; 19=
) | (1UL &lt;&lt; 15) | BIT_MASK(12, 11))<br>=C2=A0<br>=C2=A0#define X86_XC=
R0_FP					0x00000001<br>=C2=A0<br>-- <br>2.17.1<br><br></div></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CACkfA5uv_wSnv6tPozNx4eUT%3DH6v6cmLex85VmXRMs4FWQ4=
hBQ%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups=
.google.com/d/msgid/jailhouse-dev/CACkfA5uv_wSnv6tPozNx4eUT%3DH6v6cmLex85Vm=
XRMs4FWQ4hBQ%40mail.gmail.com</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

--000000000000620382058969adf2--
