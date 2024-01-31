Return-Path: <jailhouse-dev+bncBCZ5RDPSVIPRBO455GWQMGQEMWBHHYA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3a.google.com (mail-qv1-xf3a.google.com [IPv6:2607:f8b0:4864:20::f3a])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD8D8440EA
	for <lists+jailhouse-dev@lfdr.de>; Wed, 31 Jan 2024 14:44:28 +0100 (CET)
Received: by mail-qv1-xf3a.google.com with SMTP id 6a1803df08f44-6800a9505ddsf89903606d6.3
        for <lists+jailhouse-dev@lfdr.de>; Wed, 31 Jan 2024 05:44:28 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1706708668; cv=pass;
        d=google.com; s=arc-20160816;
        b=xzr7xD8cldiu8K4f4wUONTUww1d2rqaMuCA+mSm/qsVBCjrzUqUEUasAfQUIu34tvb
         WlGvVGHdGLKTpVuLylYCjHVxUohC736MPIZDNOzD3JsMDo4rfA++IEyNA3fBSRhtX38y
         TanCd1RrENvsUAbp43km/Bx4zQtBk0Y2wlfqFp5UbLSZI/zejSVODCNHUFMmjykhJ1z3
         Hq/w6OBhb2YiA2CJkRP7i6KBBB0BH/ubRjJ9DMcEsDzh/k+oQM/lpLEI/Bl32lrQDg2w
         ja/9xiIfCmzeHg/AfRfca2T75Sxty1kJrENqaJ6prUqJlCDn0SWzS2n3pcmq4cWICeyM
         g+ZA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=gfUs/XbYxhrbh626s/WCwqvmLTWxJPQEUIO3ilb3Fpo=;
        fh=5suktvKIstbsuw96Rkr4weR0hkyWMUxCy+b6cSe/QrI=;
        b=HU0bA8dpXRQTfFkbYN48f16uSheXdzA5M3i/Vbflhp2u/UTJoCNuHFGJ/QS9lGpJbN
         3qmQnSURw5rCbDV2h9YS6qv5/HN5IYnj2siQyJ+AnfT6umhs+LyheH0sCgh70WE06ZdB
         xXQKDOFQTgHMyKHuGaaGyQg/pJQvYFYw8SW01yhtLBKei8HBY10gBqnxbTUGQJGHhPin
         JNNo3jx0aRwhuPjtGnFAeqPG2TJmLFIivLoJo7CUSbQpmwnTyRr6yKt/G+nofaEYkG/f
         9ogbPkSG6tu5ix3PSCaKuo6ZM1a4mHmAzssoysnmdjzufzjez7h3EUws6w4/kN2vfwor
         uXqQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=QA45qOf3;
       spf=pass (google.com: domain of laucorbin78@gmail.com designates 2607:f8b0:4864:20::d33 as permitted sender) smtp.mailfrom=laucorbin78@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1706708668; x=1707313468; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:cc:to:subject:message-id:date:from:mime-version
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=gfUs/XbYxhrbh626s/WCwqvmLTWxJPQEUIO3ilb3Fpo=;
        b=U1DbYaRHYd4TJca6C8c2LQqgQCpyGs204x8G6F3rbLmhlU8+3dqbkcCQhYA7rJkgf7
         aSDFjP6FSdXffXiN33lBVh2Mwxl5I4SIj3VzcTCjQEcYxhhIODiWHNJ0KS4EytHZi3AL
         l4cZFu+Du/TBCSywS4f8SAgFNlxbVYsk5FyeqXnXwtI63uVX/6zKPGKWnbBSowpxgXLQ
         PBLf8uqSDP1pSKVK6NS3QjosNugJ4b5j0KckxukSSL46KdSc1CH3L2AhLZXM9hS5OdVA
         GeH/61END7Jja3HoK5SSAEKucDxI1F6BAycS8D+2fbbxFzTEa8sRCHopqbIDLXjal6h3
         sHYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706708668; x=1707313468; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:cc:to:subject:message-id:date:from:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gfUs/XbYxhrbh626s/WCwqvmLTWxJPQEUIO3ilb3Fpo=;
        b=nVWmWMoOpgGJNJydo2ZhX5TII2VtE3s1D02kCMk1It0Hahk0qLLbDJw/vCQGB5mjx0
         rlQGlLRXk5gWrm108xA8GPrnLbFZZ3pnDYxPs7ijUMXFtZW/ARcbGdyXz48nCg/H7Imy
         clf367KAfO/Zcdyx361nPUIVPZ6+RbKmxemd8l0PGLVqeU/8dVvHyhKn+KDiiTUOpWkN
         YdBUNCkqDQc82BX6ZXmfMKO2pXu95m+JdPhiQHtYjF0HOvwaOl6DMibNieO8DpbQTnVK
         nSWVv+lfxPHzNcH/nHkBs5YO/U4y9TY51H7N3Q0OBKy1z67fb7IbErWS+qniTP1WPOOn
         xV4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706708668; x=1707313468;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:cc:to:subject
         :message-id:date:from:mime-version:x-beenthere:x-gm-message-state
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=gfUs/XbYxhrbh626s/WCwqvmLTWxJPQEUIO3ilb3Fpo=;
        b=JglIqp4co3LH/ZnfRtc/2Bsi77sODOcZ1ko3kjOKetOAj8figu+RLh+d4+b8FXlHFH
         3VUSmSAf1qtnGifWHIaLWerxzVjgQWqON/Q+A33yCtSQfNplP1UoYQUZjb5a1foj1r/s
         vOc+uQ7OQn44+zd3Zw3we3yPBNc2meeIzjCPxHX7O8vWHyPpryKYE6nY6MVqwhCDqCW+
         BBhDsJhDGdNDPBYOPc4dD572DR7IikUqG43kf+MdXlDhnm1U36HdBPLS/xXrNEqJPio5
         xnExWFGmX7rrM748KJHWvKfBYD8mTj6VhXJ5qgYgKEfeRCLm76cbqNHFxBLQtHOJaFK1
         d3IA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0Yz66HiQwPbaYcjbiYeDoWMKznqdcrgOfeeWIv82SEM6UQJqUuyK
	uRBM933e6qwVnW7uB6fpJ/MU7vWSMDMnqBBHjw8k61ncCT2+xv0o
X-Google-Smtp-Source: AGHT+IFBbVF2NGEo0OUG8sznMz/aMd67Y10lF7X0grd1DPCzvNTmwtK7Kxd6Q2TSAY6Az7Ojw/6Tkw==
X-Received: by 2002:ad4:5cc1:0:b0:684:6077:f923 with SMTP id iu1-20020ad45cc1000000b006846077f923mr2082840qvb.5.1706708667626;
        Wed, 31 Jan 2024 05:44:27 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a0c:fe88:0:b0:68c:3fff:accc with SMTP id d8-20020a0cfe88000000b0068c3fffacccls195778qvs.1.-pod-prod-02-us;
 Wed, 31 Jan 2024 05:44:26 -0800 (PST)
X-Received: by 2002:ad4:5e8e:0:b0:686:1cff:676e with SMTP id jl14-20020ad45e8e000000b006861cff676emr1628464qvb.28.1706708666378;
        Wed, 31 Jan 2024 05:44:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706708666; cv=none;
        d=google.com; s=arc-20160816;
        b=WhjEFXDE0GY98iRO5ufofbWL3jFcYF1OwC+Ll5sQtUW50CQBY/OUwSNOOvJeR9vzKU
         m5S2+frQBi0fHTbq0/1SrCHjwNHKc1nYrtIMZqD+DBpoMlkJb2MyA9O3PlFpP3ocjfrW
         GX5Z93kLgPfuPHAYSxACr9vLe+q2ttH4BM9w9wzj+2EVlqCNTPn5s42ljDiCx7BWpL+c
         3oaGDy4U/V6KgY7dEO0rB6UKba6Q1pghhJzE9Lms7XGMcSLdPfX6QJrZpvB00Xj6IjQf
         I+NKXchq5xXLA9hDHut+D0q6SXHNGFXr4A+NmS/CI/Al2GXJRuPS1EaTUe7Y/lDdXbLe
         HaHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=bpHGKFUoxmUw+DUyTBgumY1RCSV24F6kZyFZBxOBp1M=;
        fh=5suktvKIstbsuw96Rkr4weR0hkyWMUxCy+b6cSe/QrI=;
        b=0HS1LPdnSpdn9BatvMsiqhfG2WVnEAAxpYw5m65WsxMhN6IxMsnTwcQaYTBn1pGCPy
         osm8pOlEHdMaLCiEFhBTRvOyuXHxJP1fWuk3ZFKtZ063XB3oNG21U4WqtLTLqjleQW5+
         spRrJI7vwrvVXHwXomNIz5+gc88IjQZpITVyeNOCfieqZwk9xqZjLS2OOAbF62pVUaP4
         FGujswQzMnClxMCjSeodCFg0v/C9nT4l2yQIqppaewT4CHdPBt6yTSGF28v5Rgx6SLMG
         3vv4MX35vqzGJXkJxIkSzOMNANT5+oKImgTxR7CX3TINve7UN59Ec02dN/9/ExK7G6b4
         2L3g==;
        dara=google.com
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=QA45qOf3;
       spf=pass (google.com: domain of laucorbin78@gmail.com designates 2607:f8b0:4864:20::d33 as permitted sender) smtp.mailfrom=laucorbin78@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com. [2607:f8b0:4864:20::d33])
        by gmr-mx.google.com with ESMTPS id i5-20020ad45c65000000b0068c4cfef6bdsi673750qvh.4.2024.01.31.05.44.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jan 2024 05:44:26 -0800 (PST)
Received-SPF: pass (google.com: domain of laucorbin78@gmail.com designates 2607:f8b0:4864:20::d33 as permitted sender) client-ip=2607:f8b0:4864:20::d33;
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-7bc332d3a8cso269859439f.2
        for <jailhouse-dev@googlegroups.com>; Wed, 31 Jan 2024 05:44:26 -0800 (PST)
X-Received: by 2002:a05:6e02:20e2:b0:363:789e:8341 with SMTP id
 q2-20020a056e0220e200b00363789e8341mr2255269ilv.23.1706708665666; Wed, 31 Jan
 2024 05:44:25 -0800 (PST)
MIME-Version: 1.0
From: Laurent Corbin <laucorbin78@gmail.com>
Date: Wed, 31 Jan 2024 14:44:14 +0100
Message-ID: <CAHakC1+9=B3JmhbG8WRgcJ__saMPkPd8U5qNK16CFU4ZgCvUxg@mail.gmail.com>
Subject: Enable smmu-V3
To: lokeshvutla@ti.com, p-yadav1@ti.com
Cc: jailhouse-dev@googlegroups.com
Content-Type: multipart/alternative; boundary="000000000000c0916e06103e133e"
X-Original-Sender: laucorbin78@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20230601 header.b=QA45qOf3;       spf=pass
 (google.com: domain of laucorbin78@gmail.com designates 2607:f8b0:4864:20::d33
 as permitted sender) smtp.mailfrom=laucorbin78@gmail.com;       dmarc=pass
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

--000000000000c0916e06103e133e
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm building a Jailhouse demo on LX2160a.
I boot a root cell and now, I'm trying to boot a Linux in a non root cell
and I'd like to enable smmuV3.
But I found some "ToDo" in the arm64/smmu-v3.c file.

Does smmuV3 work?
What else needs to be done to complete smmu-V3 support?

Thanks in advance,

Laurent

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAHakC1%2B9%3DB3JmhbG8WRgcJ__saMPkPd8U5qNK16CFU4ZgCvUxg%40mail.gmail.com.

--000000000000c0916e06103e133e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><br>I&#39;m building a Jailhouse demo on LX2160a.<b=
r>I boot a root cell and now, I&#39;m trying to boot a Linux in a non root =
cell and I&#39;d like to enable smmuV3.<br>But I found some &quot;ToDo&quot=
; in the arm64/smmu-v3.c file.<br><br>Does smmuV3 work?<br>What else needs =
to be done to complete smmu-V3 support?<br><br><div>Thanks in advance,</div=
><div><br></div><div>Laurent<br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAHakC1%2B9%3DB3JmhbG8WRgcJ__saMPkPd8U5qNK16CFU4Zg=
CvUxg%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://grou=
ps.google.com/d/msgid/jailhouse-dev/CAHakC1%2B9%3DB3JmhbG8WRgcJ__saMPkPd8U5=
qNK16CFU4ZgCvUxg%40mail.gmail.com</a>.<br />

--000000000000c0916e06103e133e--
