Return-Path: <jailhouse-dev+bncBCCYNIMESUCRBNP4Y6KQMGQEY7PKMRI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x43a.google.com (mail-pf1-x43a.google.com [IPv6:2607:f8b0:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D095538CC
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Jun 2022 19:21:59 +0200 (CEST)
Received: by mail-pf1-x43a.google.com with SMTP id bm2-20020a056a00320200b0052531ca7c1csf1793648pfb.15
        for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Jun 2022 10:21:59 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1655832118; cv=pass;
        d=google.com; s=arc-20160816;
        b=ckGT/8zC2gjH0IwPcWV7I3eQpNgj7dY0z7u1OYQ3MhvFgFeYcmFF/kBQyzLOBXbQ1f
         FTvcpDgFEYw6aVRZpOT2VsTgN9NXJscKPwX/lIpICiwlBPkLXhb4Jn4m4gxADJuwMPLs
         vbMwea8jwS/W3pOhJAdVBl5aUT898Eo8VNc66Irm2YM7mjwt1OtcZI92PtEcMPS9UVZ5
         JedZbjIYKmFUBfzz/mzVXj0EKS5AOafcKs31yIf5PvJ0xRKF3nnwN6AB90rlTIXvU5Da
         Wckzx+AgPGXlmzxH0Cf3K6FVqEC9NuZ+x+lOUL3Hi/TTw4/pgzyhtbcjHTpJ329zZMXi
         Nulg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=ID+i6iTfp7O9VEiREp3edZvE+b3zmkH+seFtRVpHpmo=;
        b=nyeL7GBWNEEa4CoAMGwHWM023S7H5ikZ/oMWwFGbn/91W1eOP9LoilmGk+TtrVovxF
         Ub9pnQf/h9cTKsR9xHTE8hSmIyg9q+e1MaW41FqIi99ZTBEUXuJZY+721pWZxTDo8a1Y
         0G1eHM7Hv89lVGD3V4nu/aV7ODnr3EnPMxryeL5pyCDL5VZd9BSR332Pk004JI1OSL4D
         QlbPISfykE8J9NKKEf4lcmIn888bMkm6CmR7gwj9Bas1+7ctRIA1ldIMTrq5C7c8SM9i
         LVbV8GX0/qhvq1f//i8tC7Ip+WWRIxYeLiDyW+YImXrnW10dyUdAYZ4mHDiGlLCWYqjG
         NoGA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=LQj2936G;
       spf=pass (google.com: domain of maurislare2@gmail.com designates 2607:f8b0:4864:20::629 as permitted sender) smtp.mailfrom=maurislare2@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ID+i6iTfp7O9VEiREp3edZvE+b3zmkH+seFtRVpHpmo=;
        b=dpBF5S9OEUfeaf/ro4QbR/uVPrSrJXft4utmpk9rfLOZFcgBXLOVxvL2rbwjyMfk1o
         jL7QI/RMnUJgWb6sQzoxhEQ+cf9JJk+YHcEcELxgsvNWQVpM4kiIKhDc3ir7q0TIxOGg
         r5g2gUlbnh7rlNTA5d0mlu4J6sitf4F590X4DqpjQEK1SnZjv6qtN6/Dk8c2sZum/x6Y
         X+I22zqEZCVj9JGlfEK4/QB3lR3iRpe1EJjCjuWFrOPsFSYtOM5m2LCgiOPhewMJ8liz
         3s87nGpdeh4Dk75TfU9dKlkKs762KK5xyaWoGsRxxD9DUmXsbkl2y0uljL35/r2Pv8IQ
         twKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ID+i6iTfp7O9VEiREp3edZvE+b3zmkH+seFtRVpHpmo=;
        b=qr65K0GSBWq/e3yQX/+8oXtiXDAMZKbaoKl0+NR8LOmbjg/jeMeBmBi0CHBe78iZyJ
         gZORmBHng48mmZYOk6HixqUUIJK1uwpGcaOuVX6OdbwlYgWiO3W4CDpNDByNkcOznhH1
         WrrG62lYt38itKfzWDOB+9eEbR9MVgdsANFnj6bVXCjYWunax8oGzzQoX76GReMn7ZiU
         27UTfhnhLQkgYmaDhSSbrQCLksC3g4yPId5PkAN0Dn7TagTza+ywAOwiEJCG5HUFvFmx
         thV3tCNPDaWTpthfRJMyTPpckF7YiLH65J/aSe2MOKHc9DYlUUiEM/ls1NMuGzcfK83H
         MSrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:mime-version:from:date:message-id:subject
         :to:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ID+i6iTfp7O9VEiREp3edZvE+b3zmkH+seFtRVpHpmo=;
        b=PjsPzyf8BEqL86fhX13CsqZ73zASRMS2kzfktnkHf2xyc6bvHGundxvpRtQzJmQICF
         gh9nZTlekmjOZD5OW5yiL8/q6C7Lr4sx9fzhb0OUBhvOEWvCoGw2hrQyzf1p/oa0D/GF
         GVxmkZnJ19uY+mgaeZvTMzQRs31a8gLcTdTKjQm7UuN3xau5QoN4e46UdwlqYOgJV3Qe
         QYqV7aX73ce90Rjtb74OFnHeeV+J6lzH0E6H5VU3Gnw2RWo8Zc0pGR2hSxgmb8HgrrnU
         EDHOizzNg4jZ+yrAA2LAQAuiialeu9Af24uMInvNTFyWylAe8xrdrKTX+DtJ8haIoJap
         PJaw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora86rm78jLNNplJxVecsKR9lju30C6wWUW4TVO+OU8VujxjVcuM3
	qC0lfpm71+jHzdUxfwfNOjY=
X-Google-Smtp-Source: AGRyM1u1b+fmEni6F4P7p76wcsNvC07yEDDehfD7y/Sbq4uk9LbqzC1hqQiuh2FIRU+tW4hYasoo7w==
X-Received: by 2002:a63:149:0:b0:40c:f753:2fb0 with SMTP id 70-20020a630149000000b0040cf7532fb0mr3914860pgb.172.1655832117752;
        Tue, 21 Jun 2022 10:21:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:e84a:b0:167:8a0f:8d92 with SMTP id
 t10-20020a170902e84a00b001678a0f8d92ls10327956plg.2.gmail; Tue, 21 Jun 2022
 10:21:56 -0700 (PDT)
X-Received: by 2002:a17:902:d50b:b0:16a:2cb3:750d with SMTP id b11-20020a170902d50b00b0016a2cb3750dmr8695150plg.17.1655832116785;
        Tue, 21 Jun 2022 10:21:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655832116; cv=none;
        d=google.com; s=arc-20160816;
        b=G7CnBxQWyVphlWKStcw6fG8FwSxBBrOYsJrPzAITqcbZX/U79rAI17a33QlXFWMK9s
         X3PBFqeKANKMCVnTAcIYNE7iufsA8U1yXnV/R1gkmm4xuTw2p00to/v8jd7qPwZoc0rg
         Fr9GbOG9pL6TEDxV3waG5nzUDIChUcBBG9ad+WiIx4ANCKXdgD+aAbm5cj5s78kYDy5D
         9iNGVBpKOrcn5SR3lQjTb9OfgdsFF72JsZvtS2f6ThGC86iVD1OMbveOAI3XfSA9vs5Z
         wGgEL2lY/3dylSVKOAawvreKtWVTyI77f17GQqX5Yto5qlmU1sJnktCGyUkao8Pn4cf/
         dlPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=0jfUZDFldpkNtNpLG2k0TUsjCA5dXMxYV2VBaimEzUw=;
        b=KkFfGE31vlcSO41U3FZR/zjLsTBWSp3ZzYwZQBgfu+5J1bByUhP008PTl3qps6eu16
         SDy648M9ONz9QV1ofdmmgAfnL00vr4ys1+uLH9R3qzh1vLTVIXtLG2U7b7KWVBb3p8jM
         zsDGTDUasNVZUl6CSBqlzfQDAXUZ8OVTBUEl/IV7phph3ddInQooAmkLuQUsWiGT7+L2
         H2DaqsXqxCrvi9xAbC3eVO6WlxSmAYIy7Xskq+3YHjsHhHQiZVZ2HJ4ba/nNwlLUsiw8
         1ajYpjXullAtYU5vCtf+BVTepZAlDX2ZCaUEBWU87FlGQmTBUYgFZWPWJydrYgUhjpjT
         izpg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=LQj2936G;
       spf=pass (google.com: domain of maurislare2@gmail.com designates 2607:f8b0:4864:20::629 as permitted sender) smtp.mailfrom=maurislare2@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com. [2607:f8b0:4864:20::629])
        by gmr-mx.google.com with ESMTPS id b3-20020a656683000000b0040d1b0de0d1si7704pgw.2.2022.06.21.10.21.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jun 2022 10:21:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of maurislare2@gmail.com designates 2607:f8b0:4864:20::629 as permitted sender) client-ip=2607:f8b0:4864:20::629;
Received: by mail-pl1-x629.google.com with SMTP id m2so5862931plx.3
        for <jailhouse-dev@googlegroups.com>; Tue, 21 Jun 2022 10:21:56 -0700 (PDT)
X-Received: by 2002:a17:90a:b797:b0:1e0:ad13:ef39 with SMTP id
 m23-20020a17090ab79700b001e0ad13ef39mr34204723pjr.8.1655832116484; Tue, 21
 Jun 2022 10:21:56 -0700 (PDT)
MIME-Version: 1.0
From: Sarah Ritterhouse <sarahritterhouse986@gmail.com>
Date: Tue, 21 Jun 2022 17:21:43 +0000
Message-ID: <CAJ1oPZ+V3aOUSoiuzvk454UGn8iBgLQNWmhm36gYTsk4hJJZ8A@mail.gmail.com>
Subject: HIIIIIIIIIIIIIIIIIIIIIIIII
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="0000000000001c5f2d05e1f87578"
X-Original-Sender: sarahritterhouse986@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=LQj2936G;       spf=pass
 (google.com: domain of maurislare2@gmail.com designates 2607:f8b0:4864:20::629
 as permitted sender) smtp.mailfrom=maurislare2@gmail.com;       dmarc=pass
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

--0000000000001c5f2d05e1f87578
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ciao, per favore confermami se questa mail =C3=A8 attiva.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CAJ1oPZ%2BV3aOUSoiuzvk454UGn8iBgLQNWmhm36gYTsk4hJJZ8A%40mail.=
gmail.com.

--0000000000001c5f2d05e1f87578
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr">Ciao, per favor=
e confermami se questa mail =C3=A8 attiva.<br></div></div></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAJ1oPZ%2BV3aOUSoiuzvk454UGn8iBgLQNWmhm36gYTsk4hJJ=
Z8A%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups=
.google.com/d/msgid/jailhouse-dev/CAJ1oPZ%2BV3aOUSoiuzvk454UGn8iBgLQNWmhm36=
gYTsk4hJJZ8A%40mail.gmail.com</a>.<br />

--0000000000001c5f2d05e1f87578--
