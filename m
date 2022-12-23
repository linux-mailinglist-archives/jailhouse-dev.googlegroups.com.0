Return-Path: <jailhouse-dev+bncBDOLRZEEUIMRBKUKSWOQMGQEUXRGQ6I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B6F654C5D
	for <lists+jailhouse-dev@lfdr.de>; Fri, 23 Dec 2022 07:05:31 +0100 (CET)
Received: by mail-wr1-x43b.google.com with SMTP id d4-20020adfa404000000b002421ca8cb07sf812129wra.2
        for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Dec 2022 22:05:31 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1671775531; cv=pass;
        d=google.com; s=arc-20160816;
        b=xkHN555PcwYzuTbZZX8mtrRQNy18ZLngFcxMyprw27SxHMvBBHkkIjqT75Su9/i9pI
         rhm2YyHBVgNiIe1heagR30ELnfsN0jk0rjlocogG52bPyoeAPlm5th/m0jt+xBHA4W+H
         aO0g4TUzUMuWEzrfNs78lE4dL+DEeoL96a/jPLxCzLZGUW2EAxTDdAcmLAX3zoczrFnK
         Qcp499Se2KMowh3XTWcDj2IJgOUeuECM8eJN6ut9tK14BhYGEX9bS7fw7L1OdYnXZ3K7
         vbbB42spcvagXXIvsea3VWMl88CBqotmmyhX1SGfZVo5YYcmqaMa8JdAcXKLx98vhg3I
         i8Mg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :mime-version:message-id:subject:to:reply-to:from:date:sender
         :dkim-signature:dkim-signature;
        bh=HisDsVPEDO8UGGgdMKA64FOLZ5ITMxQ1VOEBMUoSqDI=;
        b=kN7VHt/k+2zUtQsR/ZCCKnYv6o4jLw7BH6Z7JV1JiMtAavP4N3qPFQ2PC09Xnyqgj/
         rCP7jyuHjQypzyGfg7Ih5zm/RS9/0abfoM3Xfc49thSyPC9ehDhjV7YzWEnDwrIwcJBd
         L1WxNFJC7tLI4jZGwyLAP5fjbNNzgpyw6+PhN0nXDS2Op5Fkkq0TxsrNV8LV4C4m0+0U
         tjA5OhExB5Y66i6vcdtndJsiQ3A/VX/1GJ7RZaNZZErYZ6Htg59186tV7SL0etUCwiHB
         CBPHznPOBJsaCVSt6tKSaCfyvR1QaJNYAL2Sn+7JDbcYnUxoEt3KZEXoHus+wuonsAtU
         fgHQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=aMi0PnVs;
       spf=pass (google.com: domain of anne.dupont001@gmail.com designates 2a00:1450:4864:20::429 as permitted sender) smtp.mailfrom=anne.dupont001@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:mime-version:message-id
         :subject:to:reply-to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HisDsVPEDO8UGGgdMKA64FOLZ5ITMxQ1VOEBMUoSqDI=;
        b=nTCX4eT1U8BWZKuVfGUB7emv2UXscuXhwzk+tqV+3x0IBmuJ9VlDhe8U+R1L2qLrMq
         Oq4VLu5OPB66AuJBVkGESESL0c+r+nbXAODoG9iZBblnEHmf5qZL+YS8k+52B8rAtfej
         PXrlh1xo4z/RkLDKSdDu54GHFkeGNPGNKemNbzBC86NqPwOYf8LqTk/7RrOSkRG6Mml6
         /6aHzBuRQfR2jzaGpRtb/yU0Eev3BvkO9rp6Z6EuXG+0trV13xdcNUW7/TSa/hyctBPc
         IT+V3UjQyr5T1wtAgZZTJoceZQP1DzSIs4sdZvv2rjJVp3TYYAjJ10qWXsTiHQ+wtEYD
         Buvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:mime-version:message-id
         :subject:to:reply-to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HisDsVPEDO8UGGgdMKA64FOLZ5ITMxQ1VOEBMUoSqDI=;
        b=RxJq/ZDiVjOpSGy4+iEyBJHI3gvZPBNmxgd9V+M0ERBMQYH77g9OXI4UW079x1xXJd
         0/Lh6IRxZntimDz7C/WdRmPhZpiYCQGTz5sWlk8zRSKqd77wuSQzQyvAuHoKv0ut5MTk
         1LqG6cllWvKPfJSlBXPF+kVx5FRhJBTi+d6GzOJIYJ+TLApNXl+zF2Nvc1dO7ajaHZoB
         3uo/HRlkFoxaqOJVUZsFKkLiEGZtP94KC3Y4/yOwZjhC7PpZy5tjKXEIM3z+LE2rzbAS
         W1eeAJFjFT6j6KUW8Yt0LxxERMLt2wp+c3EPuGCbcOHZFaGx0vzLeLAAQu43lg7kl18M
         nzYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:mime-version:message-id:subject:to
         :reply-to:from:date:x-gm-message-state:sender:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HisDsVPEDO8UGGgdMKA64FOLZ5ITMxQ1VOEBMUoSqDI=;
        b=GMNQNRV+4TTn48UfKO57frqKHkND7F96l1URpIbYcWwog9gEwPSZ6rWDnW04w4b2HX
         bEjBnkSsozk16UGQuNLJavwQ9kbzvUZmrK4SITbxWFvBw1mvqNsv/YzyiGseDSlzNrZr
         jETdRNs5jQ40WOcf5yDST5U/L3cU5mKTHZ/VMhUdHwrsrm/YNip9lcLTykM1antFhlSN
         sjYA+HImFR8n/SkaIC39tFxkX3WyECEc3WrkuFGPyZzX13OnGiYLQYoL286wuN/Zsrhw
         w5/9TCaFiV8iuVLZKdPPqh4lr4uYkGGvBaRmRhwh0u2IPD6r/57k6vg/q3E2l64hDTC6
         cmgw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2koRl1ufhMko3++EhGjQ27CouCOOjaJsQnqBJ+26ZPKFRxKJrwHQ
	HrFeSapfMnPV3sS64zP6BYI=
X-Google-Smtp-Source: AMrXdXu2TEdWtBFJzJjBL8umth96N+W5W7IWoAzkUTRcMSBukxVgMp5QimOyas0Ge72HqcYqTXLl7g==
X-Received: by 2002:adf:e90c:0:b0:242:30f5:a947 with SMTP id f12-20020adfe90c000000b0024230f5a947mr386535wrm.597.1671775530919;
        Thu, 22 Dec 2022 22:05:30 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:3d89:b0:3d1:be63:3b63 with SMTP id
 bi9-20020a05600c3d8900b003d1be633b63ls3667810wmb.1.-pod-canary-gmail; Thu, 22
 Dec 2022 22:05:29 -0800 (PST)
X-Received: by 2002:a05:600c:5114:b0:3d2:5e4e:6fa with SMTP id o20-20020a05600c511400b003d25e4e06famr6116631wms.34.1671775529386;
        Thu, 22 Dec 2022 22:05:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671775529; cv=none;
        d=google.com; s=arc-20160816;
        b=VKFgHpEoMpJ8kcmJHZj3vuaeWfIc6QNqAl2n2NtbChy9zES1u02CVH7YbKTh3+i9iq
         Ly0qX3csIbPLGTtgpi+rX7HD0ibxyBFCZIQCMH3kbbsv2TPC2F4OYYk9Jljurw7d4XHG
         J41Nir5pVV8UEJhhxgFpsa72FqPSywuJV4FLuL9HPND/nvfVxkmdUUJa6uGaVXmndLf8
         23HogLR7X+e7OF+BZv+MW2pmbKqqPcV/t5esgECRWRqR8Mgzng74jrxbuuXT/w7qy3j1
         b+xi9DllDw56im0Ju0sC+UnkvOuNOWHwqMVAn+OzCMDRDJXepf35QOMjGueVXrrbgiuS
         a1zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:subject:to
         :reply-to:from:date:dkim-signature;
        bh=4vicfKDD4jO+PsB1xnqrF0cN8lEvxWcT3iOhF1C45rc=;
        b=M94krqi9yzuOmwHlJ6hNs2d2FSSWfDKkBQWvGMQoKY2tcxyqZrK6H41cnshC8enT9q
         QYh965/v7G8+hg0KK12pgktoe52nSCtQOxKjznSt8dpDiPHzQ5Fa7sMhAGAnMpqZtQda
         EdGBbe/hl1SjIiSGa4YM3qkIel+GBHItvUvgfgY0YAFsPUz2/M2eoTlm12O4l+nhmUjJ
         rqWYXpGtcFGa1R3CLVT0K2Xyy0Emi4ElzbRwbt9vmrrYxI9QJdQLlRtY9lceN/fIr7Zw
         mx+5mNEJalwLsJ2JLbRWFYqe1jKoKnLYO7LduZExRjiH2b+RCiz/OLfjoWFt6ZEmzmpk
         PKGQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=aMi0PnVs;
       spf=pass (google.com: domain of anne.dupont001@gmail.com designates 2a00:1450:4864:20::429 as permitted sender) smtp.mailfrom=anne.dupont001@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com. [2a00:1450:4864:20::429])
        by gmr-mx.google.com with ESMTPS id z5-20020a1c4c05000000b003cf1536d24dsi170640wmf.0.2022.12.22.22.05.29
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Dec 2022 22:05:29 -0800 (PST)
Received-SPF: pass (google.com: domain of anne.dupont001@gmail.com designates 2a00:1450:4864:20::429 as permitted sender) client-ip=2a00:1450:4864:20::429;
Received: by mail-wr1-x429.google.com with SMTP id o5so3708455wrm.1
        for <jailhouse-dev@googlegroups.com>; Thu, 22 Dec 2022 22:05:29 -0800 (PST)
X-Received: by 2002:a5d:5588:0:b0:273:84ed:275a with SMTP id i8-20020a5d5588000000b0027384ed275amr779689wrv.35.1671775528836;
        Thu, 22 Dec 2022 22:05:28 -0800 (PST)
Received: from [41.79.219.151] ([41.79.219.151])
        by smtp.gmail.com with ESMTPSA id t13-20020adfe44d000000b002365b759b65sm2159527wrm.86.2022.12.22.22.05.27
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Dec 2022 22:05:28 -0800 (PST)
Date: Thu, 22 Dec 2022 22:05:28 -0800 (PST)
From: Christiane Spuri <anne.dupont001@gmail.com>
Reply-To: "Christiane Spuri" <s.patrickconsulting39@gmail.com >
To: jailhouse-dev@googlegroups.com
Subject: [Attn] Business opportunity (Raw Gold Bars) jailhouse-dev@googlegroups.com on 23/12/2022 07:04:46
Message-ID: <20221223070446.86A1EE4176925EA0@gmail.com>
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: anne.dupont001@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=aMi0PnVs;       spf=pass
 (google.com: domain of anne.dupont001@gmail.com designates
 2a00:1450:4864:20::429 as permitted sender) smtp.mailfrom=anne.dupont001@gmail.com;
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

<!DOCTYPE HTML>

<HTML xmlns:o =3D "urn:schemas-microsoft-com:office:office"><HEAD><TITLE></=
TITLE>
<META content=3DIE=3Dedge http-equiv=3DX-UA-Compatible>
<META name=3DGENERATOR content=3D"MSHTML 8.00.7601.17514"></HEAD>
<BODY style=3D"MARGIN: 0.4em">
<P style=3D"LINE-HEIGHT: 106%; MARGIN: 0cm 0cm 8pt" class=3DMsoNormal><SPAN=
 style=3D"LINE-HEIGHT: 106%; FONT-FAMILY: 'Centaur', 'serif'; FONT-SIZE: 14=
pt; mso-bidi-font-family: Calibri; mso-ansi-language: EN-US" lang=3DEN-US>H=
ello jailhouse-dev@googlegroups.com<BR><BR><SPAN style=3D"LINE-HEIGHT: 106%=
; FONT-FAMILY: 'Centaur', 'serif'; FONT-SIZE: 14pt; mso-bidi-font-family: C=
alibri; mso-ansi-language: EN-US" lang=3DEN-US>
<SPAN style=3D"LINE-HEIGHT: 106%; FONT-FAMILY: 'Centaur', 'serif'; FONT-SIZ=
E: 14pt; mso-bidi-font-family: Calibri; mso-ansi-language: EN-US" lang=3DEN=
-US><SPAN style=3D"LINE-HEIGHT: 107%; FONT-FAMILY: 'Centaur', 'serif'; FONT=
-SIZE: 14pt; mso-ansi-language: EN-US" lang=3DEN-US><SPAN style=3D"LINE-HEI=
GHT: 106%; FONT-FAMILY: 'Centaur', 'serif'; FONT-SIZE: 14pt; mso-bidi-font-=
family: Calibri; mso-ansi-language: EN-US; mso-fareast-font-family: 'Times =
New Roman'; mso-fareast-language: FR" lang=3DEN-US>
On behalf of one of our clients, we are seeking for a Financial Institution=
, Insurance Company or qualified Person who can move multiple sealed cantee=
ns containing together a total of four hundred and fifty kilograms (450 kg)=
 of Raw Gold Bars, which will be sold and the money from the sale of the go=
ld used to carry out major investment projects, in any stable country.</SPA=
N>
<SPAN style=3D"mso-bidi-font-family: Calibri; mso-ansi-language: EN-US; mso=
-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-fareast-fo=
nt-family: 'Times New Roman'; mso-fareast-language: FR" lang=3DEN-US><o:p><=
/o:p></SPAN></P>
<P style=3D"LINE-HEIGHT: 106%; MARGIN: 0cm 0cm 8pt" class=3DMsoNormal><SPAN=
 style=3D"LINE-HEIGHT: 106%; FONT-FAMILY: 'Centaur', 'serif'; FONT-SIZE: 14=
pt; mso-bidi-font-family: Calibri; mso-ansi-language: EN-US; mso-fareast-fo=
nt-family: 'Times New Roman'; mso-fareast-language: FR" lang=3DEN-US>Madame=
 Christiane J.</SPAN>
<SPAN style=3D"mso-bidi-font-family: Calibri; mso-ansi-language: EN-US; mso=
-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-fareast-fo=
nt-family: 'Times New Roman'; mso-fareast-language: FR" lang=3DEN-US><o:p><=
/o:p></SPAN></P>
<P style=3D"LINE-HEIGHT: 106%; MARGIN: 0cm 0cm 8pt" class=3DMsoNormal><SPAN=
 style=3D"LINE-HEIGHT: 107%; FONT-FAMILY: 'Centaur', 'serif'; FONT-SIZE: 14=
pt; mso-bidi-font-family: Calibri; mso-ansi-language: EN-US; mso-fareast-fo=
nt-family: 'Times New Roman'; mso-fareast-language: FR; mso-bidi-language: =
AR-SA" lang=3DEN-US>Financial Expert &amp; Senior Business Consultant</SPAN=
></SPAN>
<SPAN style=3D"LINE-HEIGHT: 106%; FONT-FAMILY: 'Centaur', 'serif'; FONT-SIZ=
E: 14pt; mso-bidi-font-family: Calibri; mso-ansi-language: EN-US" lang=3DEN=
-US>Sent on <FONT face=3D"">23/12/2022 07:04:46</FONT><BR><BR></SPAN><SPAN =
style=3D"mso-bidi-font-family: Calibri; mso-ansi-language: EN-US; mso-ascii=
-font-family: Calibri; mso-hansi-font-family: Calibri" lang=3DEN-US><o:p></=
o:p></SPAN></P></SPAN></SPAN></SPAN>
<SPAN style=3D"LINE-HEIGHT: 106%; FONT-FAMILY: 'Centaur', 'serif'; FONT-SIZ=
E: 14pt; mso-bidi-font-family: Calibri; mso-ansi-language: EN-US" lang=3DEN=
-US></SPAN><SPAN style=3D"mso-bidi-font-family: Calibri; mso-ansi-language:=
 EN-US; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri" lan=
g=3DEN-US><o:p></o:p></SPAN>
<P></P></BODY></HTML>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/20221223070446.86A1EE4176925EA0%40gmail.com?utm_me=
dium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailhou=
se-dev/20221223070446.86A1EE4176925EA0%40gmail.com</a>.<br />
