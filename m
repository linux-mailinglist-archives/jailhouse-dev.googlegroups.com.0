Return-Path: <jailhouse-dev+bncBC64NUHI74MBB4HKXSQAMGQET3DCVIY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oo1-xc3e.google.com (mail-oo1-xc3e.google.com [IPv6:2607:f8b0:4864:20::c3e])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AD76B7A84
	for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Mar 2023 15:38:42 +0100 (CET)
Received: by mail-oo1-xc3e.google.com with SMTP id y140-20020a4a4592000000b0052540059057sf3356330ooa.6
        for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Mar 2023 07:38:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1678718320; cv=pass;
        d=google.com; s=arc-20160816;
        b=oKQko87lbrzlltE26ZUEw0Q2g28MfbMH1nSNUdTgCaXPqsUxfjdcmfdklHkrYjqvQh
         aIk/PYSUwPt0fQmgPO+zQkqq4Afacd49vvXkmbKw5p5/S5DLAjE6R14qO9JEwaV/bfWY
         c50rYBc+wglVhMxRwhBkyqkglXW4qiSOpL+fS1z/nqjOHAV9PNb//W2qDZm36acxDKkM
         4f9U6Ybl1js20YpaiE5TYU/z0NqXciXY7GYA/g/XwPLdKUe9JnYJUzgHkRIxu2KpP4cG
         yAktzWUoFEueGZoD2Q16wjfMIlIEOIkuGSzN9CpVSX1V4O9SgAIA3e0LBTgtzt4tzEbJ
         kPTw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=siEUkM7jU3F8eZV3cYNB4CXsb71YWXgxzHRBDEp0xMQ=;
        b=CyvZ6gxayO9NoO3nOe29aB3gY9LDJ0udDu4HNEzy1jy3LcpTgdmrMbjB7iKaN1h/Q8
         0rD+1E1ce6xO3Mv8s8DAZEqzMMTSrWChYD4HeKGErcT16xL6vDIa0MiGJh8klOKVKVbh
         2W1oTYDm5xuFE/kNNG+kwmylM4EfIsb/TGONXdblcYFqHHy0D1iX+OWS8LbDSldH1/vK
         MaAcesDLOHvZEcOSCAt/B5UtTqOMJN0F297ZTnNBxrLFQ0CViOXYTTZbttnp+neK8UBo
         gGbhQuSXX2Yy3rHyG5y8W0AbPB2T7jvzjFmA8tfsukuP5fUZppJmYNFCFNRvMmyJTaU0
         ZD6Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="DK/kxcZT";
       spf=pass (google.com: domain of tiantong411@gmail.com designates 2607:f8b0:4864:20::643 as permitted sender) smtp.mailfrom=tiantong411@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112; t=1678718320;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:to:subject:message-id:date:from:mime-version
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=siEUkM7jU3F8eZV3cYNB4CXsb71YWXgxzHRBDEp0xMQ=;
        b=WiXuLvHQgJGUoq/d1E4i9sCUKvsxE/gWMxy9iPAfbdBwi9CBc9QwBYf8IQQ7uYufXi
         CCoZ3QL/RV7OM5+tPSRf9QRZiQV4ukaiKSckzRbUAmrMXuEaBVLefZTPaCyHhoQFhQDb
         W96QGwoN4uN1SYKjakhi4OP1+6u9GR+jlZujQlwcJJQ4a3Xptetf4MVfEk615pAhQGD4
         m0kpmHpGRD8Yft3JbKW50AYllFq4RmVPv5hstXl0x2VFiEp/sSkcTZIBXhKFJoiFlpW4
         WabBVrAnMV9q1PIJH+noJTcDAuJsK/y3ZcIi2LsVaKHEkNNEUBhnsngdCtIXlzxiq409
         s93A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678718320;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to;
        bh=siEUkM7jU3F8eZV3cYNB4CXsb71YWXgxzHRBDEp0xMQ=;
        b=i7DHkhEIoCdY3fJ3bbSVVjQp8GHkYOkeXW8F/p7coEZEk/jUmULxr3pHKNx2YxzOx6
         kK4vd0S902I5SX9wOg5ex9AOGVrVcJAAZop967c5UhAqK1Hoh7WYMYhfKrVgcU3gnHYj
         NQkAhLP+fEoLHqlr/H2HiDE+yMdy/Dmdb9qumeO3H6tKT4tQeKau4h/Ods9drYzicfFr
         bYfxLF+2DH4haVnW7ozavZIVDroM0dxfgJJ38IpB5h7FwDUMkcQRM8aFDuIHPRtnFAhw
         Focl3CkRjZC4JMxgz9Nao0ZLCH19lzS3dQzHXmgot5NZAWWJQn1jzenYSDBL4/af2duv
         ZgVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678718320;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:to:subject
         :message-id:date:from:mime-version:x-gm-message-state:sender:from:to
         :cc:subject:date:message-id:reply-to;
        bh=siEUkM7jU3F8eZV3cYNB4CXsb71YWXgxzHRBDEp0xMQ=;
        b=q7b8nXwL3w1HT6Zg/7Qod+6nQ0z5EeB8RNpeR4NaiEVWuimHiwHkm/GwY/opIQEjUD
         755Y3g7HfyPzEpJw/hFFiAu1B2kNAfDwyamUXuQ/S0hjUuHFtqdI4pZIBcAt/CjYCQJ/
         0o/hC8VWmInJh0pFKWNFJQLOD0mfHxSdYS6uhMVnonQarCE8SWGVszmOi42kRhjvAJPK
         K8V3iGptbKU9mGjUn6ev9TlGoq+HmOHorm/nooEz3wX9V240ERszhkfIejOys01XQDSf
         l5a+vI9D3PJPSQZWq7ge4NIwOUDid7dVNro1eQbUZr/UUImyYOy8PwgyR7FT6uQOMk1R
         ho0g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKU9n9nDogEiEslM9I4kUYJJRgbVY4f7EYtIkw5DJqFIUqW/lADF
	Hv3IH7x+dtiQxDgyThVFuCY=
X-Google-Smtp-Source: AK7set855mJhQvnGrVVMwW7LRVVmxGk1zvuW8ArlbA4uUDlbibgEMgqqAbJNTmv5JcUplZoAfZIWIw==
X-Received: by 2002:a05:6830:158:b0:68d:3fc4:a1e7 with SMTP id j24-20020a056830015800b0068d3fc4a1e7mr3972108otp.2.1678718320745;
        Mon, 13 Mar 2023 07:38:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:62c1:0:b0:694:3ac6:71e with SMTP id z1-20020a9d62c1000000b006943ac6071els2880419otk.11.-pod-prod-gmail;
 Mon, 13 Mar 2023 07:38:40 -0700 (PDT)
X-Received: by 2002:a05:6830:928:b0:68b:d61c:168f with SMTP id v40-20020a056830092800b0068bd61c168fmr19461607ott.11.1678718319921;
        Mon, 13 Mar 2023 07:38:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678718319; cv=none;
        d=google.com; s=arc-20160816;
        b=SW8RU4dw9inE5lOu0aaIgdjBkxwNbCBhrkUBsVHzKG5JWKyJS6Edf0r1OJz8foSjvU
         WHDF8i4ccu+EVQVqeEFqHMx2J2i5l8/TGYl8kGFXVOUTDjh5iC+cgCTUb3PXLzzEUqRj
         mn6B+r6tHyhMJXqiMcDqpxUojh6Dw2lPOmlUt13aT8SkLjIa05anaBwukQGpmNGRn+bt
         2ajGuuFE66uNr7s/EuAEiOhvIvC1wnUfa28/sQhsKH63qzUKl1RCUPayc7zdnBJqXPuF
         FuRAqjygLdPojO8jVaAvUJSKmDlKYtmmHtkunMCX0o9YKfpwX1TGQ1jb8nrzkWK2yCsa
         Z29w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=spq2qdLkT+7WJGRKnPSobxA2I9f3pqEPEAhrxY3tSGQ=;
        b=yWUM9BGzlAVODzw4oUCamiAFTcuau/Z08PdYDQp4tt75l5qgjWJRcwChobmQ5S5+2T
         /p24yfHYW/Pvz0ttbDuCkMnuysH0z1bAqczucfYRaF1tpWsSnM0VBrEbDTyM4sHvgSiv
         aZDwkxkHKOP/fChikmpcf+SmiJ1yJs+HWcrp5lDsCXpsipRsk6iLuPWzrCDm1vHY2AlW
         Sb2/shXxsglkJlxtR3CLmh6N5QNaAtlpnjXbXL67MWmjdMrjTRbgSb07hXL+x7u58Z65
         X0zlYdjttSh8BpAorK/TBLNkIwRhRbwBxKLZ4fIzNjHK4SQ1r9UdW+ipDWjxZw5r2Ais
         fgXg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="DK/kxcZT";
       spf=pass (google.com: domain of tiantong411@gmail.com designates 2607:f8b0:4864:20::643 as permitted sender) smtp.mailfrom=tiantong411@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com. [2607:f8b0:4864:20::643])
        by gmr-mx.google.com with ESMTPS id r2-20020a4ad4c2000000b005176d876205si796982oos.0.2023.03.13.07.38.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Mar 2023 07:38:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of tiantong411@gmail.com designates 2607:f8b0:4864:20::643 as permitted sender) client-ip=2607:f8b0:4864:20::643;
Received: by mail-pl1-x643.google.com with SMTP id p20so13144467plw.13
        for <jailhouse-dev@googlegroups.com>; Mon, 13 Mar 2023 07:38:39 -0700 (PDT)
X-Received: by 2002:a17:90a:88a:b0:23d:ef4:513b with SMTP id
 v10-20020a17090a088a00b0023d0ef4513bmr1051703pjc.8.1678718319145; Mon, 13 Mar
 2023 07:38:39 -0700 (PDT)
MIME-Version: 1.0
From: TONG TIAN <tiantong411@gmail.com>
Date: Mon, 13 Mar 2023 22:38:28 +0800
Message-ID: <CAGE391V8ZXcw-fZt3yqQspYYdD3TOgTQ04m2J33XMMMwy8DWDw@mail.gmail.com>
Subject: 
To: jailhouse-dev@googlegroups.com
Content-Type: multipart/alternative; boundary="00000000000017389c05f6c91168"
X-Original-Sender: tiantong411@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b="DK/kxcZT";       spf=pass
 (google.com: domain of tiantong411@gmail.com designates 2607:f8b0:4864:20::643
 as permitted sender) smtp.mailfrom=tiantong411@gmail.com;       dmarc=pass
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

--00000000000017389c05f6c91168
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,How can I quickly understand or learn jailhouse code=EF=BC=9Fthank you!

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CAGE391V8ZXcw-fZt3yqQspYYdD3TOgTQ04m2J33XMMMwy8DWDw%40mail.gm=
ail.com.

--00000000000017389c05f6c91168
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,How can I quickly understand or learn jailhouse code=EF=
=BC=9Fthank you!<br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAGE391V8ZXcw-fZt3yqQspYYdD3TOgTQ04m2J33XMMMwy8DWD=
w%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.g=
oogle.com/d/msgid/jailhouse-dev/CAGE391V8ZXcw-fZt3yqQspYYdD3TOgTQ04m2J33XMM=
Mwy8DWDw%40mail.gmail.com</a>.<br />

--00000000000017389c05f6c91168--
