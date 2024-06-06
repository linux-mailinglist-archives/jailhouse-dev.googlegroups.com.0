Return-Path: <jailhouse-dev+bncBCFOBSFJ6MNRBCUNQSZQMGQEDPSQMLA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3c.google.com (mail-yb1-xb3c.google.com [IPv6:2607:f8b0:4864:20::b3c])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8E18FDB98
	for <lists+jailhouse-dev@lfdr.de>; Thu,  6 Jun 2024 02:45:00 +0200 (CEST)
Received: by mail-yb1-xb3c.google.com with SMTP id 3f1490d57ef6-dfa478f473esf118167276.0
        for <lists+jailhouse-dev@lfdr.de>; Wed, 05 Jun 2024 17:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1717634699; x=1718239499; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jtBD+wKKUzuEbZHOhi2rlDgcnu/OMmCsvBmdm5DDNKk=;
        b=lRUp0A4Gw5TK1PVdl+2O/uTBbW9WgAlHRxDtZCFlRj2B5IwzPd8mA5VFI6aOgRCIIV
         TP+e2ziOFK/ZcHxpVc7/92CRX3R4iSS8XrHEPdqpMmS4+adduvj+k5v56mURS86tyqAo
         ecPTOFQs9EEM70q5Ti8ABBpxlwp2PL4LKNoNZllRCE9g8/kVfKwhbgB0ozXjeU0nk7cE
         ar8X9JgDsSuCmhsdhyI99vCQ9l+xe58aJfYFedQtex9q9OwiDNVlmlx9y/CSHoIpFjPp
         H8G3EsZZznQNLC7RC+kkkeOkdISvChKeOdn1gNr75rJwDa4M+7QRl+hLrTACFi0oXX80
         BQig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717634699; x=1718239499; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jtBD+wKKUzuEbZHOhi2rlDgcnu/OMmCsvBmdm5DDNKk=;
        b=m779SIkAJ/f0pzsRvtZX2c2i/ZYYDyORzCt6ALcXrzWHh/tbde1UuguHuSM9gT4hBc
         lXXRMgCSH5B3ti0UDQFcUv6R4UYP5ZD1NOkR3reqZGLwcQtVgiR5/8rNzPiSdhs86mWY
         lW3yH5lpS1MwHeydpWO9+3tg2UwFB45MAsA5lUTDjec1dxnyaOZZChXJ79jAjaMRpIqa
         aVzG+fP+x8GPuyzLNZzWGAWMBPky0eAKdQ7hBEHfZAxMAPZ45f7az1XuqN+hYk6BMTfe
         0qdXkwCixULqc9M+6ghuN2T+IU82U/JgL69fgrmzdzNgqlB7qGDvzYOOtdmkSk/O6dlK
         zZKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717634699; x=1718239499;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jtBD+wKKUzuEbZHOhi2rlDgcnu/OMmCsvBmdm5DDNKk=;
        b=W6Y63cYi9XHZ6AWNQssWziYeDzYBSVs0LZFTCcBtXNJG4WVySSYl1VYQ8QSOBd8mqY
         X6mmckfx2NNRrJ0qmfxdo1HltiGO9mlpGe2UlpohAwAw7Gqv8oTl+I7bLYteumG6JK+c
         fa0DMAUA5l5E2kx0M/rvQE32TqkegWturVO5vn03HHLdWBSmIi7o3RlysNnWVUXutObv
         vrveJHjR/LfCuNQWhJ9Nf+uEWWEG6hpHAeVGMJJIRHmk7ucf0RN/sdexnD9i1jAHeZA+
         kuWDwFn0geKX+EmgdwLcZBeSVLOLwTW29cA81N5NiDUstkVeKPFpnN+YoDGlICcLrA8J
         re8Q==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCWB1vpWMpWKIrJx1xOfnQhVWLEmcwh4UyOp6gwlhnO5prMOIdPcY/1G+B8HwulfB5Flvba5H6dUKOvJ4HG86EYy9/ZNVENSfhPJosA=
X-Gm-Message-State: AOJu0YzQafaCRkqMguNpUsLCNHsRctBiTfqIorXmpqSP+TcqdZ7x/k/c
	kHbCpOaMGhSTQquq4TqGZ4u51N/VFvpRr0gVOMQMutsUYVTSFcPm
X-Google-Smtp-Source: AGHT+IEkYZOGEunIti3DTKyVVOXrr+U7RR8gEE4s4GrwGQbyQGXuv5g2yw2+sL+0d09nDSjpMtezdA==
X-Received: by 2002:a05:6902:2481:b0:df7:a3c6:c849 with SMTP id 3f1490d57ef6-dfacad59181mr3200957276.4.1717634699499;
        Wed, 05 Jun 2024 17:44:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:ab70:0:b0:df7:7249:e3b with SMTP id 3f1490d57ef6-dfae014ea08ls425457276.0.-pod-prod-04-us;
 Wed, 05 Jun 2024 17:44:57 -0700 (PDT)
X-Received: by 2002:a05:690c:4:b0:622:d03f:ebf with SMTP id 00721157ae682-62cbb4cb742mr11886037b3.3.1717634697529;
        Wed, 05 Jun 2024 17:44:57 -0700 (PDT)
Date: Wed, 5 Jun 2024 17:44:56 -0700 (PDT)
From: Larry Cruz <atungang28@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <88f13c1b-5c6d-49e7-a8c6-b8178970424dn@googlegroups.com>
In-Reply-To: <34fe78a8-d51b-4d7c-a3e2-18666e0aa12an@googlegroups.com>
References: <c1903dda-39bd-4ef8-97e2-0c2c0864a962n@googlegroups.com>
 <cfc43845-9041-40e0-81f6-d71886acd878n@googlegroups.com>
 <3a2fedea-7608-4eef-9b1d-ec5efe8ae518n@googlegroups.com>
 <f2aea1c1-7c31-4545-b9c2-a3bf711b60b6n@googlegroups.com>
 <0e5a22f5-e031-454e-b125-c1a8509618ccn@googlegroups.com>
 <34fe78a8-d51b-4d7c-a3e2-18666e0aa12an@googlegroups.com>
Subject: Re: ORDER CLONE CARDS ONLINE SWIFT CASHOUT FROM THE ATM MACHINE
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_27100_1853274434.1717634696346"
X-Original-Sender: atungang28@gmail.com
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

------=_Part_27100_1853274434.1717634696346
Content-Type: multipart/alternative; 
	boundary="----=_Part_27101_48389372.1717634696346"

------=_Part_27101_48389372.1717634696346
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Get at me for your low & high balance clone cards going for cool prices.
https://t.me/Ricko_swavy8/product/good-trip-milk-chocolate-bars-for-sale/=
=20
Clone cards are spammed credit cards with clean funds. My clone cards are=
=20
available for cash out in ATMs=F0=9F=8F=A7,Gas stations=E2=9B=BD=EF=B8=8F a=
nd can be used for online=20
purchases. Our clone card comes with an ATM pin for easy cash outs =E2=84=
=A2=EF=B8=8F
$300 for balance $2k
$400 for balance $5K
$500for balance $7k
$700 for balance $10k
https://t.me/Ricko_swavy8/product/good-trip-milk-chocolate-bars-for-sale/

High balance
$1k for balance $15k
$3k for balance $30k
$5k balance $50k
$7k for balance $ 75k
https://t.me/Ricko_swavy8/product/good-trip-milk-chocolate-bars-for-sale/
https://t.me/Ricko_swavy8/product/good-trip-milk-chocolate-bars-for-sale/
=E2=80=A2 Shipping =F0=9F=9B=AB =F0=9F=9B=AB

=E2=80=A2 Swift Delivery On DHL & FedEx

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/88f13c1b-5c6d-49e7-a8c6-b8178970424dn%40googlegroups.com.

------=_Part_27101_48389372.1717634696346
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Get at me for your low &amp; high balance clone cards going for cool prices=
.<div>https://t.me/Ricko_swavy8/product/good-trip-milk-chocolate-bars-for-s=
ale/ Clone cards are spammed credit cards with clean funds. My clone cards =
are available for cash out in ATMs=F0=9F=8F=A7,Gas stations=E2=9B=BD=EF=B8=
=8F and can be used for online purchases. Our clone card comes with an ATM =
pin for easy cash outs =E2=84=A2=EF=B8=8F</div><div>$300 for balance $2k</d=
iv><div>$400 for balance $5K</div><div>$500for balance $7k</div><div>$700 f=
or balance $10k</div><div>https://t.me/Ricko_swavy8/product/good-trip-milk-=
chocolate-bars-for-sale/</div><div><br /></div><div>High balance</div><div>=
$1k for balance $15k</div><div>$3k for balance $30k</div><div>$5k balance $=
50k</div><div>$7k for balance $ 75k</div><div>https://t.me/Ricko_swavy8/pro=
duct/good-trip-milk-chocolate-bars-for-sale/</div><div>https://t.me/Ricko_s=
wavy8/product/good-trip-milk-chocolate-bars-for-sale/</div><div>=E2=80=A2 S=
hipping =F0=9F=9B=AB =F0=9F=9B=AB</div><div><br /></div><div>=E2=80=A2 Swif=
t Delivery On DHL &amp; FedEx<br /><br /></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/88f13c1b-5c6d-49e7-a8c6-b8178970424dn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/88f13c1b-5c6d-49e7-a8c6-b8178970424dn%40googlegroups.co=
m</a>.<br />

------=_Part_27101_48389372.1717634696346--

------=_Part_27100_1853274434.1717634696346--
