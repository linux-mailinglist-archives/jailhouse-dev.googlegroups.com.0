Return-Path: <jailhouse-dev+bncBCHKZ6U5VMPBBEOCQL3QKGQEWEQONKY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x340.google.com (mail-ot1-x340.google.com [IPv6:2607:f8b0:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5A21F50B2
	for <lists+jailhouse-dev@lfdr.de>; Wed, 10 Jun 2020 11:00:07 +0200 (CEST)
Received: by mail-ot1-x340.google.com with SMTP id e66sf717743otb.9
        for <lists+jailhouse-dev@lfdr.de>; Wed, 10 Jun 2020 02:00:07 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591779601; cv=pass;
        d=google.com; s=arc-20160816;
        b=xSbgn4jOQIHXCmDFzviRU2pZq6Wf8KsQyq/LrR0vva2HBl/gUhiXzhwEx03TPTZaTH
         LiYNA7HbburY5mYkFdd1jSRU58uzYgRXBm5C5B3Q9EGeHBuabsg4JNPC+LbzG8DhK0gm
         GdUFKe28v5uPvXufx5KtjVr/Iz91HvJDbCCp60TXhgujarj2GNmpkzsVXibzlQnl3uUk
         rmH8wvHaKk3a122btCg02zZZXeloaVDD5KNNHtFcmkzedtrlhN7ovDZOokhgjfcXCCvE
         e58DPfQoDv9Y+EUui4IMC0RzUa5h/I62919LLa/stb9nIdQzSNEW9XZaBFKsxhdJWLZh
         JcPQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=M+XP3vpsJCA556c27uUQWKJFHOlhq1QNFrojgJMgNFk=;
        b=JU9moc2u5B3ZXydwzZdFYnS3py5wM6EP4stiQY1bt8lShvLwnWjCic3q3Nx2Uf3j9Q
         lkgp5QVSySHIAACaQIgS5wjkWtc57uUS7sHgbZof0FdDMvH/5/55GjpHMi7KFksb+5u6
         Wsx7vpEIPt16Kv+8H4kXAgjb8CaTR+Lv1rYPwq7hQNys/uBx3N6oOnw6+XrQz+oo4xBR
         L1IFuaG7lxqXGBK1jGucLMXsT1Gvkw7UF7R9mbgrlyu2A/Nk8UQO8lrnpUi/XjZs8r35
         1gJZeR4x9dGpBXX0aRkLNbGlhr6i0ZUDO1pk7tfBEE762pPZqflW1rubEW+aql2wabpk
         7euA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=mepPGJUE;
       spf=pass (google.com: domain of emiliakudrina@gmail.com designates 2607:f8b0:4864:20::d42 as permitted sender) smtp.mailfrom=emiliakudrina@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=M+XP3vpsJCA556c27uUQWKJFHOlhq1QNFrojgJMgNFk=;
        b=quke+L/PXhyhtnlpx3rDw2Ro8cBVQzMcXLycyKscYDX0JJyUnUI3YbZdK86HBaNvb+
         CqhwShkIzyOmCSzYOq9G+WC7FwX0LRh8DDEgbs9S2MbIPeqKKv1YTVv1HHYLm0jHtHbb
         FuCivikdj7CaBlIuioybEgJIPObRTg0NXF7WExnGRqye6ECFWrUvu91xADPbf9M6rI4C
         nL0dHlH/zeywXRRVrNBRTS+0V5bWMEyteL1E719GdqC9umvMVsg12BRu/Q0tMHrfOuqj
         zIASylyQYz1CrJQ1CmHlcs4QNSwUGAkpDsoqZwNQJeJW8a6k3LpUOdP2gUOefoUH/jEM
         uGqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=M+XP3vpsJCA556c27uUQWKJFHOlhq1QNFrojgJMgNFk=;
        b=RJ3vh+9zbEqqEVNP0FW9jV7+m06t+lg5wjJYI63YK07NDTi6Mlzk9YXdZwSytQlYta
         zbcjvJ1KiT5E2CtukBlQOUK0oTD98RByygM+JqSzB25EoCncSnRXTPyE74V0KkJC95Ki
         BLWZUWyZr1/r/KB1XRw8hXSTfpzNnNHJSl/mWOYluazetR+jHaySOS+SudYsI0lbi2lY
         Leq+yafWzJFpVP9QkkXntcVpn1+favcCyvabykrs4bSPGzbPRVSR8knozH5xqUmit3HZ
         B8V/WWe1XPubKoij0ig5lCzYFhr6guh6WuPzoGp/LLtuIRtng2I+lA9Bpoi6eakJhUlB
         Cw2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:date:message-id:subject
         :to:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=M+XP3vpsJCA556c27uUQWKJFHOlhq1QNFrojgJMgNFk=;
        b=iQCTX4sojFVO+O+Gsdmi9opKNV/BHhYIVQ2ZbQKhS1O1i3BTOsrpNWtHA152vOReqU
         C/DvwzG3TXhUe/Usr2IHjs8iMwFRecV4LauaFYDL+dMTU5oY8pRyt7IIcQjNyIFbcb70
         nbJ+zrnMatRIli9LgIV3kRO+GB88Fw9yAWPmLXZhws/UwBFWHA4WiI4qynVpMGbfF6IC
         UeqqiZC/09k/2r9bdZMdrgLG1H2T5TrhEu4fLgfv8ui+4hnS9AYA425qIfuc9TgYlt7O
         AnQlSsDRiFVTOIEzQC5cVyB8ybMeG84fUgV4L99CfHamTF/c/qUoI7k52lVU/LqRIzCT
         oBnQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530oSJHI0T0j39+ooKEc2SBexqxYUiaXW74754ejMYdcP19ktVrH
	JcriYdVrXCvw3jbiwR8oc8Q=
X-Google-Smtp-Source: ABdhPJzAZUwB9FX/8ubGZceTdaHyeqtEvQCZmWEqomYO1AWVgZRJwqCtXNOtUEro04BY6wPlIDUg0g==
X-Received: by 2002:aca:4d13:: with SMTP id a19mr1720978oib.158.1591779601309;
        Wed, 10 Jun 2020 02:00:01 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6830:11ce:: with SMTP id v14ls4949458otq.0.gmail; Wed,
 10 Jun 2020 02:00:00 -0700 (PDT)
X-Received: by 2002:a05:6830:1f1b:: with SMTP id u27mr1834132otg.327.1591779600846;
        Wed, 10 Jun 2020 02:00:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591779600; cv=none;
        d=google.com; s=arc-20160816;
        b=EaEwA8XBntqf84PRsTr+mXnfB4H/viKJ7D8jEe8Cs6UXcg+azPNF6tb+eusdOj7qu3
         gpgRREzBqeY1UINwSlebNCaLIJxA6GOys2l4A+LWFgpVgpqxHvw/6Z6Lus/ILbaNlR/1
         An+j6qJGpWQx483S3wB3V2Aty3XwsYRHcw1Tst11egGCO75r86Z6xW/WCMaHpnYtBpvl
         tW2bbBow/MtroJlEMejBa9HqPfglPkq5rOQRm9qXwcmgfXSdVGvXt8nw5IOLsawMoOzM
         ZcjZS6MeNldnlRi5e8YO5sEK4q9uj5vQTxgmGDrEBeQ8Ny0SFtWDSyd5omFqJ3jXseqt
         rTyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=+HPH6g+XZ8eZKfEryzlLa7tNsNus3bO7zthjEP9fmHc=;
        b=eBd36xuw8C6Fswaunymew+onziaOtKDUaLXssB2z6N93mCnp9+wMtThf7b1+zzxgS5
         yF7RNXZW8WGiiVoBQs59y1bhqagEe5/Kj0xLLwXHim5a8mYlBRchAwre6IeaJkBktwxv
         elAAcA2o8WK7DxmGAmB/iCtwzeHZn1pHH955TAyasF6PsCeLywMQW3jhQJK9AadWpRvF
         7+viaTipD9nmf+5uicBZqDs8KE/PmWKXu2ftbhegAQUPJIN5HfKj/RNopi6YnIlPKEqr
         ACJeP8Yrtc/rHCxDJb/nGQEgeutfoEuNSKDZhG6nLVBX87Y0SuKabXfF1PlSljBS20Pr
         n63A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=mepPGJUE;
       spf=pass (google.com: domain of emiliakudrina@gmail.com designates 2607:f8b0:4864:20::d42 as permitted sender) smtp.mailfrom=emiliakudrina@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com. [2607:f8b0:4864:20::d42])
        by gmr-mx.google.com with ESMTPS id o199si951994ooo.0.2020.06.10.02.00.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2020 02:00:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of emiliakudrina@gmail.com designates 2607:f8b0:4864:20::d42 as permitted sender) client-ip=2607:f8b0:4864:20::d42;
Received: by mail-io1-xd42.google.com with SMTP id q8so1294742iow.7
        for <jailhouse-dev@googlegroups.com>; Wed, 10 Jun 2020 02:00:00 -0700 (PDT)
X-Received: by 2002:a02:c84b:: with SMTP id r11mr2213662jao.110.1591779600459;
 Wed, 10 Jun 2020 02:00:00 -0700 (PDT)
MIME-Version: 1.0
From: Emilia Kudrina <emiliakudrina@gmail.com>
Date: Wed, 10 Jun 2020 12:59:49 +0400
Message-ID: <CABnRrYe054wxqyD4r+6JLMBHmYmTPKA4=UxPs2D4dv87Xj-p5w@mail.gmail.com>
Subject: Please, join me on Youtube
To: hrniratanka@googlegroups.com
Content-Type: multipart/alternative; boundary="000000000000a56c0f05a7b71151"
X-Original-Sender: EmiliaKudrina@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=mepPGJUE;       spf=pass
 (google.com: domain of emiliakudrina@gmail.com designates 2607:f8b0:4864:20::d42
 as permitted sender) smtp.mailfrom=emiliakudrina@gmail.com;       dmarc=pass
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

--000000000000a56c0f05a7b71151
Content-Type: text/plain; charset="UTF-8"

Hello dear friends, hope you all are fine!
please join my channel on Youtube:
https://www.youtube.com/watch?v=vBSNIgLmYEo

with love & peace!
Emilia

[image: Mailtrack]
<https://mailtrack.io?utm_source=gmail&utm_medium=signature&utm_campaign=signaturevirality5&>
Sender
notified by
Mailtrack
<https://mailtrack.io?utm_source=gmail&utm_medium=signature&utm_campaign=signaturevirality5&>
10.06.20,
12:56:27

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CABnRrYe054wxqyD4r%2B6JLMBHmYmTPKA4%3DUxPs2D4dv87Xj-p5w%40mail.gmail.com.

--000000000000a56c0f05a7b71151
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><span style=3D"font-size:13px">Hello dear friends, hop=
e you all are fine!</span>=C2=A0=C2=A0<br>please join my channel on Youtube=
:=C2=A0<br><a href=3D"https://www.youtube.com/watch?v=3DvBSNIgLmYEo">https:=
//www.youtube.com/watch?v=3DvBSNIgLmYEo</a>=C2=A0<div><br></div><div>with l=
ove &amp; peace!=C2=A0<br>Emilia=C2=A0<br><br><div id=3D"mt-signature">
        <table border=3D"0" cellpadding=3D"8" cellspacing=3D"0" style=3D"us=
er-select: none;">
            <tbody><tr>
                <td>
                    <a href=3D"https://mailtrack.io?utm_source=3Dgmail&amp;=
utm_medium=3Dsignature&amp;utm_campaign=3Dsignaturevirality5&amp;" class=3D=
"" style=3D"text-decoration:none">
                        <img src=3D"https://s3.amazonaws.com/mailtrack-sign=
ature/sender_notified.gif" alt=3D"Mailtrack" class=3D"" width=3D"32" height=
=3D"32">
                    </a>
                </td>
                <td>
                    <span style=3D"color:#777">Sender notified by</span> <b=
r>
                    <a href=3D"https://mailtrack.io?utm_source=3Dgmail&amp;=
utm_medium=3Dsignature&amp;utm_campaign=3Dsignaturevirality5&amp;" class=3D=
"mt-install" style=3D"color:#4374f7">Mailtrack</a>
                    <span style=3D"color:transparent;font-size:0">10.06.20,=
 12:56:27</span>
                </td>
                <td>
                   =20
                </td>
            </tr>
        </tbody></table>
    </div></div><img width=3D"0" height=3D"0" class=3D"mailtrack-img" alt=
=3D"" style=3D"display:flex" src=3D"https://mailtrack.io/trace/mail/b6de209=
6d263063a32c46a26c69a269dc640613f.png?u=3D5585490"></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CABnRrYe054wxqyD4r%2B6JLMBHmYmTPKA4%3DUxPs2D4dv87X=
j-p5w%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://grou=
ps.google.com/d/msgid/jailhouse-dev/CABnRrYe054wxqyD4r%2B6JLMBHmYmTPKA4%3DU=
xPs2D4dv87Xj-p5w%40mail.gmail.com</a>.<br />

--000000000000a56c0f05a7b71151--
